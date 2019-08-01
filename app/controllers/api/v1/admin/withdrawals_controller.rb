class Api::V1::Admin::WithdrawalsController < Api::V1::Admin::AdminsController

  # list all pending and aprove withdrawals
  def index
    result = Withdrawal.all.where(withdrawal_status: params[:status]).order(created_at: :desc)
    render json: result, status: 200
  end

  # list all pending and aprove withdrawals
  def show
    result = Withdrawal.find(params[:id])
    render json: result, status: 200
  end

  # aprove withdrawals and send payment
  def update
    @withdrawal  =  Withdrawal.find_by(uuid: params[:id])
    @withdrawal.skip_balance_validation = true
    if @withdrawal.update(withdrawal_params)
      render json: @withdrawal, status: :ok
    else
      render json: { message: @withdrawal.errors.map { |x, mess| "#{x} #{mess}".capitalize } }, status: :unprocessable_entity
    end
  end

  # destroy withdrawal and flag it as deleted at
  def destroy
    ActiveRecord::Base.transaction do
      withdrawal = Withdrawal.find_by(uuid:params[:id])
      withdrawal.with_lock do
        if withdrawal.soft_delete
          vault = withdrawal.user.vault
          vault.update(amount:vault.amount + withdrawal.value, total_withdrawals: vault.total_withdrawals - withdrawal.value)
          render json: { message: 'Destroyed' }, status: 200
        else
          render json: { message: 'Some error ocurred' }, status: 401
        end
      end
    end
  end

  private

    def withdrawal_params
      params.permit(
        :withdrawal_status,
        :comments,
        :wallet,
        :currency_id,
        :txid,
        :ticker
      )
    end

end