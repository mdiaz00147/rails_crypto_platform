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

class WithdrawalSerializer < ActiveModel::Serializer
  attributes :id, :uuid, :settle, :value, :fees, :wallet, :txid, :ticker, :created_at, :confirmed_at, :withdrawal_status, :withdrawal_type

  has_one :currency
  has_one :user

  def confirmed_at
    return object.created_at.strftime("%d/%m/%Y %I:%M%p")
  end

  def created_at
    return object.created_at.strftime("%d/%m/%Y %I:%M%p")
  end

end
