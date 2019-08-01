# == Schema Information
#
# Table name: subscriptions
#
#  id                  :integer          not null, primary key
#  uuid                :string
#  user_id             :integer
#  plan_id             :integer
#  invoice_id          :integer
#  subscription_status :integer          default("active")
#  expiration          :datetime
#  deleted_at          :datetime
#  lock_version        :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  payments_enabled    :boolean          default(TRUE)
#
# Indexes
#
#  index_subscriptions_on_invoice_id  (invoice_id) UNIQUE
#  index_subscriptions_on_user_id     (user_id)
#

class Subscription < ApplicationRecord
	before_create :generate_uuid

  belongs_to :user, -> { with_deleted }, required: false
	belongs_to :plan, required: false, class_name: 'Plan', primary_key: 'code', foreign_key: 'plan_id'
	belongs_to :invoice, -> { with_deleted }, required: false
  has_many :rewards

  enum subscription_status: %i[active expired cancelled]

  private

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
