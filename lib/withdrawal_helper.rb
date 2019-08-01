module WithdrawalHelper

  def self.create_withdrawal(object,withdrawal_type)
    ActiveRecord::Base.transaction do
      withdrawal = object.user.withdrawals.new(
        value: (withdrawal_type === 'amount' && object.amount) || object.amount_fast, 
        withdrawal_type:  (withdrawal_type === 'amount' && 'withdrawal_amount') || 'withdrawal_amount_fast',
        currency_id: 12,
        wallet: object.user.btc_wallet
      )
      withdrawal.amount_fast =  withdrawal_type === 'amount' && false || withdrawal_type === 'amount_fast' && true
      withdrawal.with_lock do
        if withdrawal.save
          vault_update(withdrawal, withdrawal_type)
        end
      end
    end
  end

  def self.vault_update(withdrawal, withdrawal_type)
    withdrawal.with_lock do
      vault         = withdrawal.user.vault
      vault.with_lock do
        if withdrawal_type === 'amount'
          vault.amount  -= withdrawal.value.to_f
        else
          vault.amount_fast  -= withdrawal.value.to_f
        end
        vault.total_withdrawals += withdrawal.value.to_f
        vault.save!
      end
      withdrawal.save!
    end
  end

end

