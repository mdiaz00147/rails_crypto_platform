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

class SubscriptionSerializer < ActiveModel::Serializer
  attributes :uuid, :created_at, :subscription_status, :double_percent, :triple_percent

  has_one :plan

  def double_percent
    max_pay = object.plan.price * 2
    paid    = object.rewards.where(reward_type: 'incentive').pluck(:value).sum
    result  = ((100 * paid) / max_pay).to_f.round(2)
    return result
  end

  def triple_percent
    max_pay = object.user.subscriptions.joins(:plan).select('plans.price AS plan_price').map{|x| x.plan_price }.sum * 3
    paid    = object.user.total_3x_rewards
    result  = ((100 * paid) / max_pay).to_f.round(2)
    return result
  end

 

end
