namespace :refresh_rewards_depth do
  desc 'update rewards depth to user'
  task :update => :environment do
    RefreshRewardDepth.refresh
  end
end
