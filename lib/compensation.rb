module Compensation

  # residual bonusses to all upline
  def self.create_residual_reward(invoice,subscription_id)
    base_price  = (invoice.plan.price) * 0.3
    value       = ((base_price * 50) / 100).round(2)
    first_user  = User.find_by(uuid: invoice.user.parent_uuid)
    first       = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: first_user.id, subscription_id: subscription_id) if first_user
    if first_user
      value         = ((base_price * 12) / 100).round(2)
      second_user   = User.find_by(uuid: first_user.parent_uuid)
      second        = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: second_user.id, subscription_id: subscription_id) if second_user
      if second_user
        value         = ((base_price * 10) / 100).round(2)
        third_user    = User.find_by(uuid: second_user.parent_uuid)
        third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: third_user.id, subscription_id: subscription_id) if third_user
        if third_user
          value         = ((base_price * 8) / 100).round(2)
          fourth_user   = User.find_by(uuid: third_user.parent_uuid)
          third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: fourth_user.id, subscription_id: subscription_id) if fourth_user
          if fourth_user
            value         = ((base_price * 8) / 100).round(2)
            fifth_user    = User.find_by(uuid: fourth_user.parent_uuid)
            third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: fifth_user.id, subscription_id: subscription_id) if fifth_user
            if fifth_user
              value         = ((base_price * 7) / 100).round(2)
              sixth_user    = User.find_by(uuid: fifth_user.parent_uuid)
              third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: sixth_user.id, subscription_id: subscription_id) if sixth_user
              if sixth_user
                value         = ((base_price * 5) / 100).round(2)
                seventh_user    = User.find_by(uuid: sixth_user.parent_uuid)
                third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: seventh_user.id, subscription_id: subscription_id) if seventh_user
              end
            end
          end
        end
      end
    end

    return true
  end

  def self.create_residual_reward_second(invoice,subscription_id)
    base_price  = (invoice.plan.price) * 0.15
    value       = ((base_price * 50) / 100).round(2)
    first_user  = User.find_by(uuid: invoice.user.parent_uuid)
    first       = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: first_user.id, subscription_id: subscription_id) if first_user
    if first_user
      value         = ((base_price * 15) / 100).round(2)
      second_user   = User.find_by(uuid: first_user.parent_uuid)
      second        = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: second_user.id, subscription_id: subscription_id) if second_user
      if second_user
        value         = ((base_price * 12) / 100).round(2)
        third_user    = User.find_by(uuid: second_user.parent_uuid)
        third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: third_user.id, subscription_id: subscription_id) if third_user
        if third_user
          value         = ((base_price * 7) / 100).round(2)
          fourth_user   = User.find_by(uuid: third_user.parent_uuid)
          third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: fourth_user.id, subscription_id: subscription_id) if fourth_user
          if fourth_user
            value         = ((base_price * 5) / 100).round(2)
            fifth_user    = User.find_by(uuid: fourth_user.parent_uuid)
            third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: fifth_user.id, subscription_id: subscription_id) if fifth_user
            if fifth_user
              value         = ((base_price * 4) / 100).round(2)
              sixth_user    = User.find_by(uuid: fifth_user.parent_uuid)
              third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: sixth_user.id, subscription_id: subscription_id) if sixth_user
              if sixth_user
                value         = ((base_price * 3) / 100).round(2)
                seventh_user    = User.find_by(uuid: sixth_user.parent_uuid)
                third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: seventh_user.id, subscription_id: subscription_id) if seventh_user
                if seventh_user
                  value         = ((base_price * 2) / 100).round(2)
                  eight_user    = User.find_by(uuid: seventh_user.parent_uuid)
                  third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: eight_user.id, subscription_id: subscription_id) if eight_user
                  if eight_user
                    value         = ((base_price * 1) / 100).round(2)
                    ninth_user    = User.find_by(uuid: eight_user.parent_uuid)
                    third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: ninth_user.id, subscription_id: subscription_id) if ninth_user
                    if ninth_user
                      value         = ((base_price * 1) / 100).round(2)
                      tenth_user    = User.find_by(uuid: nineth_user.parent_uuid)
                      third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: tenth_user.id, subscription_id: subscription_id) if tenth_user
                    end
                  end
                end
              end
            end
          end
        end
      end
    end

    return true
  end
  # create direct bonus on the system
  def self.create_direct_reward(invoice, subs)
    base_price  = (invoice.plan.price)
    first_user  = User.find_by(uuid: invoice.user.parent_uuid)
    value       = first_user && first_user.last_subs && ((base_price * first_user.last_subs.plan.unilevel_percent_1.to_f) / 100).round(2)
    first       = Reward.create(value: value, reward_type: 'direct', reward_status: 'paid', currency_id: 11, user_id: first_user.id, subscription_id: subs[:id]) if first_user
    if first_user
      second_user   = User.find_by(uuid: first_user.parent_uuid)
      value         = second_user &&  second_user.last_subs && ((base_price * second_user.last_subs.plan.unilevel_percent_2.to_f) / 100).round(2)
      second        = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: second_user.id, subscription_id: subs[:id]) if second_user
      if second_user
        third_user    = User.find_by(uuid: second_user.parent_uuid)
        value         = third_user &&  third_user.last_subs && ((base_price * third_user.last_subs.plan.unilevel_percent_3.to_f) / 100).round(2)
        third         = Reward.create(value: value, reward_type: 'residual', currency_id: 11, user_id: third_user.id, subscription_id: subs[:id]) if third_user
      end
    end
  end

  def self.create_subscription(invoice)
    invoice.user.subscriptions.create(
      plan_id: invoice.plan_id,
      invoice_id: invoice.id
    )
  end

  # update user points depending on the current invoice paid
  def self.update_binary_points(subs, invoice)
    parents = subs.user.ancestors
    value   = subs.plan.point

    parents.each do |parent|
      active_plans = true
      # if parent.subscriptions.where(subscription_status_id: 11).pluck(:id).size.positive?
      ActiveRecord::Base.transaction do
        if active_plans
          parent_point = parent.point
          parent_point.with_lock do
            if parent.children[0].descendants.where(uuid: subs.user.uuid).exists? || parent.children[0].uuid == subs.user.uuid
              if parent.children[0].left_son == true
                parent_point.left_total_points += value.to_i
                parent_point.left_points += value.to_i
              else
                parent_point.right_total_points += value.to_i
                parent_point.right_points += value.to_i
              end
            else
              if parent.children[1].left_son == true
                parent_point.left_total_points += value.to_i
                parent_point.left_points += value.to_i
              else
                
                parent_point.right_total_points += value.to_i
                parent_point.right_points += value.to_i
              end
            end
            parent_point.right_total_points > parent_point.left_total_points ? parent_point.diff = parent_point.right_total_points - parent_point.left_total_points : parent_point.diff = parent_point.left_total_points - parent_point.right_total_points
            parent_point.save
          end
        end
      end
    end
  end
end