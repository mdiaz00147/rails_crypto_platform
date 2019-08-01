# == Schema Information
#
# Table name: withdrawals
#
#  id                :integer          not null, primary key
#  uuid              :string
#  user_id           :integer
#  settle            :float
#  value             :float
#  fees              :float
#  comments          :text
#  wallet            :string
#  currency_id       :integer
#  txid              :string
#  ticker            :string           default("0")
#  lock_version      :integer
#  withdrawal_uniq   :string
#  withdrawal_status :integer          default("pending")
#  withdrawal_type   :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  deleted_at        :datetime
#
# Indexes
#
#  index_withdrawals_on_user_id          (user_id)
#  index_withdrawals_on_withdrawal_uniq  (withdrawal_uniq) UNIQUE
#

class Withdrawal < ApplicationRecord
  attr_accessor :amount_fast, :skip_balance_validation

  # callbacks
  before_create :generate_uuid
  before_create :calc_fees
  before_create :withdrawal_uniq

  # # validations
  validates :value, uniqueness: { scope: [:user_id, :created_at] }, numericality: { greater_than_or_equal_to: 0 }, :on => :create
  validates :wallet, presence: true, :on => :create
  validate  :vault_balance, :on => :create
  validates_uniqueness_of  :withdrawal_uniq, message: 'Only one withdraw per day allowed', :on => :create
  

  # associations
  belongs_to :currency, required: false, class_name: 'Currency', primary_key: 'code', foreign_key: 'currency_id'
  belongs_to :user, required: false

  enum withdrawal_status: %i[pending paid cancelled]
  enum withdrawal_type: %i[withdrawal_amount withdrawal_amount_fast]

  scope :only_deleted, -> { unscope(where: :deleted_at).where.not(deleted_at: nil) }
  scope :with_deleted, -> { unscope(where: :deleted_at) }
  default_scope -> { where(deleted_at: nil) }

  def soft_delete
    update(deleted_at: Time.zone.now)
  end
  
  private
    def calc_fees
      self.fees   = (self.value.to_f.round(2) * 0.07).round(2)
      self.settle = (self.value.to_f.round(2) * 0.93).round(2)
    end

    def vault_balance
      if self.amount_fast
        if self.user.vault.amount_fast.to_f < self.value.to_f  
          return errors.add(:withdrawal, "Amount to withdraw can't be greater than your balance")
        end
      else
        if self.user.vault.amount.to_f < self.value.to_f
          return errors.add(:withdrawal, "Amount to withdraw can't be greater than your balance")
        end
      end
    end

    def one_per_day
      if self.user.withdrawals.where(created_at: (Time.zone.now.beginning_of_day)..(Time.zone.now)).count > 0
        return errors.add(:maximum, " withdrawals per day reached")
      end
    end

    def generate_uuid
      self.uuid = SecureRandom.uuid
    end

    def withdrawal_uniq
      self.withdrawal_uniq = "uni_#{user.username.strip}_#{Time.now.strftime('%m_%d_%Y')}"
    end
end
