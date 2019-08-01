namespace :verify_subscription do
  desc "Check subscription if has expired"
  task check_expiration_subscription: :environment do
    Subscription.where(subscription_status_id: 11).each do |subscription|
      ActiveRecord::Base.transaction do
        if subscription.expiration < Date.today
          EmailNotification.subscription_expired(subscription.user)
          subscription.expired!
        end
      end
    end
  end
end