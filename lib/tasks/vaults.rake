namespace :vaults do

  desc "Verify all rewards with status pending and sum them to user vault"
  task update_vaults: :environment do
    @rewards = Reward.where(reward_status: 'pending')
    @rewards.each do |x|
      VaultsUpdateJob.perform_later(x)
    end
  end
  
end
