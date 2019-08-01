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

class RewardSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :value, :created_at, :referred_user

  has_one :currency
  has_one :reward_status
  has_one :reward_type
  has_one :subscription

  def created_at
    return object.created_at.strftime("%d/%m/%Y %I:%M%p")
  end

  def referred_user
    (object.reward_type === 'direct' || object.reward_type === 'residual') && object.subscription.user.username
  end
end
