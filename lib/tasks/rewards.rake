namespace :rewards do

  desc "Create binary rewards based on tree"
  task create_binary_rewards: :environment do
    @users = User.where(active_binary:true)
    @users.each do |user|
      BinaryRewardsJob.perform_later(user)
    end
  end

  desc "Create daily investment rewards based on active subscriptions"
  task create_investment_rewards: :environment do
    subscriptions      = Subscription.where(subscription_status: 'active', payments_enabled:true, created_at:(Time.now.beginning_of_day - 10.years)..(Time.now.beginning_of_day - 5.days)).joins(:plan).select(:id,:user_id,:created_at,:lock_version, 'plans.price AS plan_price')
    percents_available = [0.005,0.0051,0.0052,0.0053,0.0054,0.0055,0.0056,0.0057,0.0058,0.0059,0.0060,0.0061,0.0062,0.0063,0.0064,0.0065,0.0066,0.0067,0.0068,0.0069,0.007]

    percent            = percents_available.sample
    subscriptions      = subscriptions.map{ |x|
      RoibonusJob.perform_later(x, percent, x.plan_price.to_f)
    }
  end
end
