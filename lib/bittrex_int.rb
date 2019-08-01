module BittrexInt
  # Brings the last price for given pair
  def self.ticker(pair)
    api_call  = HTTParty.get('https://bittrex.com/api/v1.1/public/getticker?market=' + pair)
    json = JSON.parse(api_call.body)
    return json['result']['Last'] if json['success']
    return { error: json['message'] }
  end
  
end