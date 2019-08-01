# == Schema Information
#
# Table name: vaults
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  amount               :decimal(20, 2)   default(0.0)
#  total_rewards        :decimal(20, 2)   default(0.0)
#  total_withdrawals    :decimal(20, 2)   default(0.0)
#  incentive_comissions :decimal(20, 2)   default(0.0)
#  direct_comissions    :decimal(20, 2)   default(0.0)
#  binary_comissions    :decimal(20, 2)   default(0.0)
#  residual_comissions  :decimal(20, 2)   default(0.0)
#  lock_version         :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  amount_fast          :decimal(20, 2)   default(0.0)
#
# Indexes
#
#  index_vaults_on_user_id  (user_id) UNIQUE
#

class Vault < ApplicationRecord
  belongs_to :user, required: false
end
