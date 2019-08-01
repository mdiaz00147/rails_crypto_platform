# == Schema Information
#
# Table name: invoices
#
#  id                     :integer          not null, primary key
#  uuid                   :string
#  price                  :decimal(20, 8)   default(0.0)
#  fees                   :decimal(20, 8)   default(0.0)
#  wallet                 :string
#  txid                   :string
#  currency_id            :integer
#  invoice_status         :integer          default("pending")
#  user_id                :integer
#  plan_id                :integer
#  blokio_notification_id :string
#  lock_version           :integer
#  deleted_at             :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_invoices_on_user_id  (user_id)
#

class Invoice < ApplicationRecord
  belongs_to :currency, required: false, class_name: 'Currency', primary_key: 'code', foreign_key: 'currency_id'
  belongs_to :user, -> { with_deleted }, required: false
  belongs_to :plan, required: false, class_name: 'Plan', primary_key: 'code', foreign_key: 'plan_id'

  validates :user_id, presence: true
  validates :plan_id, presence: true
  validates :currency_id, presence: true

  before_create :generate_uuid
  before_create :create_crypto_wallet, if: -> { self.currency_id != 11}
  before_create :calculate_price, if: -> { self.currency_id != 11}

  scope :only_deleted, -> { unscope(where: :deleted_at).where.not(deleted_at: nil) }
  scope :with_deleted, -> { unscope(where: :deleted_at) }
  default_scope -> { where(deleted_at: nil) }

  enum invoice_status: %i[pending paid cancelled]

  def soft_delete
    update(deleted_at: Time.zone.now)
  end

  private
    def calculate_price
      ticker = Blockio.get_tickers(currency_id.to_i).to_f.round(6)
      self.price = ((plan.price.to_f) / ticker)
      self.fees = ((plan.fees.to_f) / ticker)
    end

    def create_crypto_wallet
      self.wallet = Blockio.generate_wallet(user.username.to_s + '_' + SecureRandom.uuid, currency_id.to_i)
    end

		def generate_uuid
			self.uuid = SecureRandom.uuid
		end
end
