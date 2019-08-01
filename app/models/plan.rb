# == Schema Information
#
# Table name: plans
#
#  id                 :integer          not null, primary key
#  name               :string
#  description        :text
#  price              :decimal(20, 8)   default(0.0)
#  fees               :decimal(20, 8)   default(0.0)
#  expiration_days    :integer
#  daily_percent      :decimal(20, 8)   default(0.0)
#  active             :boolean          default(TRUE)
#  code               :integer
#  point              :integer          default(0)
#  subscription       :boolean          default(FALSE)
#  unilevel_percent_1 :decimal(20, 2)   default(0.0)
#  unilevel_percent_2 :decimal(20, 2)   default(0.0)
#  unilevel_percent_3 :decimal(20, 2)   default(0.0)
#  unilevel_percent_4 :decimal(20, 2)   default(0.0)
#  unilevel_percent_5 :decimal(20, 2)   default(0.0)
#  residual_depth     :decimal(20, 2)   default(0.0)
#  lock_version       :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_plans_on_code  (code) UNIQUE
#

class Plan < ApplicationRecord
  has_many :invoices, foreign_key: "code", class_name: "Invoice"
  has_many :subscriptions, foreign_key: "code", class_name: "Subscription"

end
