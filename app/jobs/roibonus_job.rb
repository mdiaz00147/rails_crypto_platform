class RoibonusJob < ApplicationJob
  queue_as :cbc_create_investment_rewards

  def perform(object, percent, plan_price)
    profit     = (plan_price *  percent).to_f.round(2)
    reward       = object.rewards.create(value: profit, user_id: object.user_id, currency_id: 11) 
    # if reward
      # CompensationJob.perform_later(object.user_id,profit,object.id) 
      # Compensation.create_residual_mining(object.user_id,profit,object.id)
    # end
  end
end
