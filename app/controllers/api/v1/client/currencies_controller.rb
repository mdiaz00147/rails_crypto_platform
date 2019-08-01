class Api::V1::Client::CurrenciesController < Api::V1::Client::ClientsController

  # get the last 10 crypto currency prices
  def index
    api_call  = HTTParty.get('https://api.coinmarketcap.com/v1/ticker?limit=10')
    json      = JSON.parse(api_call.body)
    render json: json, status: 200
  end

end