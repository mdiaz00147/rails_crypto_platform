class Api::V1::Admin::BlockioWalletsController < Api::V1::Admin::AdminsController

  def get_current_price
    result = HTTParty.get(Blockio.base_uri +  '/api/v2/get_current_price/?api_key=' + Blockio.api_key(params[:currency_id].to_f) + '&price_base=USD')
    render json: result
  end

  def withdraw
    BlockIo.set_options :api_key=> params[:api_key], :pin => params[:pin], :version => 2
    result = BlockIo.withdraw :amounts => params[:amounts], :to_addresses =>  params[:to_addresses], :nonce => params[:nonce]
    render json: result
  end

  def get_network_fee_estimate
    BlockIo.set_options :api_key=> params[:api_key], :pin => params[:pin], :version => 2
    if Blockio.validate_wallet_by_api(params[:to_addresses], params[:api_key])
      result = BlockIo.get_network_fee_estimate :amounts => params[:amounts], :to_addresses =>  params[:to_addresses]
    else
      result = { message: 'Invalid Wallet' } 
    end
    render json: result, status: 200
  end
  
end
