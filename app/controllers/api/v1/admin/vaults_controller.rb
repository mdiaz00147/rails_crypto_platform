class Api::V1::Admin::VaultsController < Api::V1::Admin::AdminsController

  def index
    result = (params[:type] === 'amount' && Vault.where("amount > ?", params[:value])) || (Vault.where("amount_fast > ?", params[:value]))
    result = result.map{|x| WithdrawalHelper.create_withdrawal(x,params[:type]) }
    render json: result
  end
  
  # show user vault
  def show
    result = Vault.find(params[:id])
    result = Vault.find_by(user_id:params[:user_id]) if params[:user_id]
    render json: result
  end

end
