
User.all.map{|x|
  total = x.rewards.pluck(:value).sum.round(2)
  total_direct =  x.rewards.where(reward_type: 'direct').pluck(:value).sum.round(2)
  total_residual =  x.rewards.where(reward_type: 'residual').pluck(:value).sum.round(2)
  total_incentive =  x.rewards.where(reward_type: 'incentive').pluck(:value).sum.round(2)

  x.vault.update(total_rewards:total, direct_comissions: total_direct, residual_comissions: total_residual,  incentive_comissions: total_incentive)
}



20.times do |item|
  User.create(
    username: "master1#{item + 20}", 
    email: 'admin@cryptobusinesscompany.com', 
    password: '121212',
    password_confirmation: '121212',
    uuid: SecureRandom.uuid,
    parent_uuid: User.find_by(username:'master119').uuid, 
    active:true, 
    confirmed_at: Time.now.utc, 
    right: false, 
    left_son: true,
    enable_tree: true
  )

end



0 17 * * * /bin/bash -l -c 'cd /usr/share/nginx/tradingwaves/api && RAILS_ENV=production bundle exec /usr/local/rvm/gems/ruby-2.3.0/bin/rake vaults:update_vaults'
0 3 * * * /bin/bash -l -c 'cd /usr/share/nginx/tradingwaves/api && RAILS_ENV=production bundle exec /usr/local/rvm/gems/ruby-2.3.0/bin/rake rewards:create_binary_rewards'
30 3 * * * /bin/bash -l -c 'cd /usr/share/nginx/tradingwaves/api && RAILS_ENV=production bundle exec /usr/local/rvm/gems/ruby-2.3.0/bin/rake rewards:create_bot_binary_rewards'
0 4 * * 1,2,3,4,5 /bin/bash -l -c 'cd /usr/share/nginx/tradingwaves/api && RAILS_ENV=production bundle exec /usr/local/rvm/gems/ruby-2.3.0/bin/rake rewards:create_investment_rewards'
0 4 * * * /bin/bash -l -c 'cd /usr/share/nginx/tradingwaves/api && RAILS_ENV=production bundle exec /usr/local/rvm/gems/ruby-2.3.0/bin/rake verify_bot:check_expiration_bot'
*/10 * * * * /bin/bash -l -c 'cd /usr/share/nginx/tradingwaves/api && RAILS_ENV=production bundle exec /usr/local/rvm/gems/ruby-2.3.0/bin/rake blockio:enable_notification'
0 5 * * * /usr/bin/curl https://api3.tradingwaves.co/api/v1/client/points/balance