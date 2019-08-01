class Api::V1::Client::WithdrawalsController < Api::V1::Client::ClientsController

  # List current withdrawals for current user
  def index
    result = @current_user.withdrawals.order(created_at: :desc)
    render json: result, status: 200
  end

  # user can request a withdrawal to crypto wallet or sell value to another user
  def create
    ActiveRecord::Base.transaction do
      withdrawal = @current_user.withdrawals.new(withdrawal_params)
      withdrawal.with_lock do
        if @current_user.enabled_google_authenticator?
          if @current_user.otp_authentic?(params[:google_code])
            update_withdrawal(withdrawal)
          else
            render json: { errors: ['wrong code, try a new code'] }, status: 400
          end
        else
          update_withdrawal(withdrawal)
        end
      end
    end
  # rescue => e
  #   render json: { errors: ["Withdrawal can't created"] }, status: 400
  end

  # destroy withdrawal and flag it as deleted at
  def destroy
    withdrawal = Withdrawal.find_by(uuid:params[:id])
    withdrawal.with_lock do
      ActiveRecord::Base.transaction do
        if withdrawal.soft_delete
          vault = withdrawal.user.vault
          vault.with_lock do
            vault.update(amount:(vault.amount + withdrawal.value).round(2), total_withdrawals: (vault.total_withdrawals - withdrawal.value).round(2))
          end
          render json: { message: 'Destroyed' }, status: 200
        else
          render json: { message: 'Some error ocurred' }, status: 401
        end
      end
    end
  end

  private

  def update_withdrawal(withdrawal)
    if withdrawal.save
      WithdrawalHelper.vault_update(withdrawal, params[:vault_amount])
      render json: withdrawal, status: :ok
    else
      render json: { errors: withdrawal.errors.map { |x, mess| "#{mess}".capitalize } }, status: 400
    end
  end

  def withdrawal_params
    params.permit(
      :value,
      :currency_id,
      :wallet,
      :vault_amount,
      :withdrawal
    )
  end
end
