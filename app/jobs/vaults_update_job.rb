class VaultsUpdateJob < ApplicationJob
  queue_as :cbc_update_vaults

  def perform(object)
    # Do something later
    ActiveRecord::Base.transaction do
      reward = Reward.find_by(reward_status:'pending', id: object.id)
      if reward
        reward.with_lock do
          vault = reward.user.vault
          vault.with_lock do
            value         = reward.value.round(2)
            vault.amount += value
            update_reward = reward.update(reward_status: 'paid')
            vault.save if update_reward
          end
        end
      end
    end

  end

end
