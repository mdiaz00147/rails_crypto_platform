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

class InvoiceSerializer < ActiveModel::Serializer
  attributes :uuid, :id, :fees, :wallet, :txid, :created_at, :invoice_status, :price

  has_one :currency
  has_one :plan
  has_one :user

  def created_at
    return object.created_at.strftime("%d/%m/%Y %I:%M%p")
  end
  

end
