module Blockio

  def self.get_tickers(currency)
    api_call = HTTParty.get(self.base_uri +  '/api/v2/get_current_price/?api_key=' + self.api_key(currency) + '&price_base=USD')
    json = JSON.parse(api_call.body)['data']['prices'].map{|x| x['price']}.min.to_f
  end

  def self.generate_wallet(identifier, currency)
    api_call = HTTParty.get(self.base_uri + '/api/v2/get_new_address/?api_key=' + self.api_key(currency) + '&label=' + identifier)
    json = JSON.parse(api_call.body)
    json['data']['address'].to_s
  end

  def self.api_key(currency)
    currency == 12 ? Rails.application.secrets.blockio_btc_key : Rails.application.secrets.blockio_ltc_key
  end

  def self.validate_wallet(wallet, currency)
    api_call = HTTParty.get(self.base_uri + '/api/v2/is_valid_address/?api_key=' + self.api_key(currency) + '&address=' + wallet)
    json     = JSON.parse(api_call.body)
    json['data']['is_valid']
  end

  def self.validate_wallet_by_api(wallet, api)
    api_call = HTTParty.get(self.base_uri + '/api/v2/is_valid_address/?api_key=' + api + '&address=' + wallet)
    json     = JSON.parse(api_call.body)
    json['data']['is_valid']
  end

  def self.base_uri
    'https://block.io'
  end

end
