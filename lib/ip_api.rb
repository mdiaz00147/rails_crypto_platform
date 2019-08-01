module IpApi
  DEFAULT_URL = 'http://www.geoplugin.net/'

  def self.get_country_iso(ip)
    api_call  = HTTParty.get(DEFAULT_URL + '/json.gp?ip=' + ip)
    json      = JSON.parse(api_call.body)
    return json
  end

end
