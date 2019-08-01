User.create(username: 'rootcode', temp_user: false, email: 'admin@cryptobusiness.com', password: '121212', active:true, parent_uuid: 'first_node', admin: true)

Currency.create(name: 'USD', code: 11, decimals: 2)
Currency.create(name: 'BTC', code: 12, decimals: 8)
Currency.create(name: 'LTC', code: 13, decimals: 8)

# InvoiceStatus.create(name: 'Pending', code: 11, description: 'Invoice Pending')
# InvoiceStatus.create(name: 'Paid', code: 12, description: 'Invoice paid')
# InvoiceStatus.create(name: 'Cancelled', code: 13, description: 'Invoice cancelada')

# SubscriptionStatus.create(name: 'Active', code: 11, description: 'Subscription active')
# SubscriptionStatus.create(name: 'Expired', code: 12, description: 'Subscription expired')

# RewardStatus.create(name: 'Pending', code: 11, description: 'Reward Pending')
# RewardStatus.create(name: 'Paid', code: 12, description: 'Reward paid')
# RewardStatus.create(name: 'Cancelled', code: 13, description: 'Reward cancelada')

# RewardType.create(name: 'Daily mining Bonus', code: 11, description: 'Daily mining Bonus')
# RewardType.create(name: 'Affilliate Bonus', code: 12, description: 'Affilliate Bonus')
# RewardType.create(name: 'Binary Bonus', code: 13, description: 'Reward for binary')
# RewardType.create(name: 'Residual Bonus', code: 14, description: 'Residual Bonus')

User.create(username: 'leftleader', temp_user: false, ancestry: 1, email: 'admin@cryptobusiness.com', password: '121212', parent_uuid: User.first.username, active:true, right: false, left_son: true)
User.create(username: 'rightleader', temp_user: false, ancestry: 1, email: 'admin@cryptobusiness.com', password: '121212', parent_uuid: User.first.username, active:true, right: true, left_son: false)

# WithdrawalStatus.create(name: 'Pending', code: 11, description: 'Withdrawal pending')
# WithdrawalStatus.create(name: 'Paid', code: 12, description: 'Withdrawal confirmed')
# WithdrawalStatus.create(name: 'Cancelled', code: 13, description: 'Withdrawal cancelled')
# WithdrawalStatus.create(name: 'Confirm', code: 14, description: 'Withdrawal Confirm')

Plan.create(name: 'Beginner', code: 11, price: 200, expiration_days: 30, subscription: false, point: 200, unilevel_percent_1: 5)
Plan.create(name: 'Scout',code: 12, price: 600, expiration_days: 30, subscription: false, point: 600, unilevel_percent_1: 5, unilevel_percent_2: 2)
Plan.create(name: 'Walker', code: 13, price: 1000, expiration_days: 30, subscription: false, point: 1_000, unilevel_percent_1: 15,unilevel_percent_2: 3,unilevel_percent_3: 2)
Plan.create(name: 'Ranger', code: 14, price: 3000, expiration_days: 30, subscription: false, point: 3_000, unilevel_percent_1: 15,unilevel_percent_2: 3,unilevel_percent_3: 2)
Plan.create(name: 'Rover', code: 15, price: 7000, expiration_days: 30, subscription: false, point: 7_000, unilevel_percent_1: 20,unilevel_percent_2: 3,unilevel_percent_3: 2)
Plan.create(name: 'Spaceman', code: 16, price: 10000, expiration_days: 30, subscription: false, point: 10_000, unilevel_percent_1: 20,unilevel_percent_2: 3,unilevel_percent_3: 2)

# User.find_each { |tu| tu.update_attribute(:otp_secret_key, ROTP::Base32.random_base32) }
# User.find_each { |tu| tu.update_attribute(:enabled_google_authenticator, true) }

