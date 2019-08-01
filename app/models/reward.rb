# == Schema Information
#
# Table name: rewards
#
#  id              :integer          not null, primary key
#  uuid            :string
#  value           :decimal(20, 8)   default(0.0)
#  currency_id     :integer
#  user_id         :integer
#  subscription_id :integer
#  reward_status   :integer          default("pending")
#  reward_type     :integer          default("incentive")
#  deleted_at      :datetime
#  lock_version    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_rewards_on_subscription_id  (subscription_id)
#  index_rewards_on_user_id          (user_id)
#

class Reward < ApplicationRecord
  # callbacks
  #   before_validation :validation_values
  before_create :generate_uuid
  before_create :check_2x_sub_value, if: -> { self.reward_type == "incentive" }
  before_create :check_3x_account_value, if: -> { self.reward_type != "incentive" }
  before_create :update_total_vault

  # associations
  belongs_to :user, -> { with_deleted }, required: false
  belongs_to :currency, required: false, class_name: "Currency", primary_key: "code", foreign_key: "currency_id"
  belongs_to :subscription, required: false

  # validations
  validates :currency_id, presence: true
  validates :user_id, presence: true
  validate  :active_subs

  enum reward_status: %i[pending paid]
  enum reward_type: %i[incentive direct binary residual]

  default_scope -> { where("value > ?", 0) }

  private

  def update_total_vault
    vault = user.vault
    vault.with_lock do
      total_rewards = vault.total_rewards + value

      case reward_type
      when "incentive"
        total = vault.incentive_comissions + value
        vault.update(incentive_comissions: total.round(2), total_rewards: total_rewards.round(2))
      when "direct"
        total = (vault.direct_comissions + value).round(2)
        amount_fast = (vault.amount_fast + value).round(2)
        vault.update(amount_fast: amount_fast, direct_comissions: total.round(2), total_rewards: total_rewards.round(2))
      when "binary"
        total = vault.binary_comissions + value
        vault.update(binary_comissions: total.round(2), total_rewards: total_rewards.round(2))
      when "residual"
        total = vault.residual_comissions + value
        vault.update(residual_comissions: total.round(2), total_rewards: total_rewards.round(2))
      else
        0
      end
    end
  end

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end

  def validation_values
    @user_subs = Subscription.where(user_id: self.user_id).select(:id, :subscription_status, :price)
    @user_rewards = Reward.where(user_id: self.user_id).select(:id, :value, :subscription_id, :reward_type)
  end

  # Check if the current account can recive it double price
  def check_3x_account_value
    max_value = (account_subs.joins(:plan).select(:id).select("plans.price AS plan_price").map { |x| x.plan_price }.sum * 3).round(2)
    rewards_value = (self.user.rewards.where.not(reward_type: "incentive").pluck(:value).sum).round(2)

    if (rewards_value + self.value) > max_value
      self.value = (max_value - rewards_value).round(2)
      account_subs.update(subscription_status: "expired")
    end
  end

  def check_2x_sub_value
    max_value = (self.subscription.plan.price * 2).round(2)
    rewards_value = (self.subscription.rewards.where(reward_type: "incentive").pluck(:value).sum).round(2)

    if (rewards_value + self.value) > max_value
      self.value = (max_value - rewards_value).round(2)
      self.subscription.update(subscription_status: "expired")
    end
  end

  def account_subs
    self.user.subscriptions
  end

  def account_active_subs
    account_subs.where(subscription_status:'active')
  end

  def active_subs
    errors.add(:subscriptions, message: "No active subscriptions") if account_active_subs.count === 0
  end
end
