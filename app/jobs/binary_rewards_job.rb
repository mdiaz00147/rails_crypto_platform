class BinaryRewardsJob < ApplicationJob
  queue_as :cbc_create_binary_rewards

  def perform(user)
    # Do something later
    ActiveRecord::Base.transaction do
      point = user.point
      point.with_lock do
        if point.left_points > point.right_points
          value = 0.09 * point.right_points
          point.left_points -= point.right_points
          point.right_points = 0
          if value > 0
            Reward.create(value: value, reward_type: 'binary', currency_id: 11, user_id: user.id) 
          end
        else
          value = 0.09 * point.left_points
          point.right_points -= point.left_points
          point.left_points = 0
          if value > 0
            Reward.create(value: value, reward_type: 'binary', currency_id: 11, user_id: user.id) 
          end
        end
        point.save
      end
    end
  end
end
