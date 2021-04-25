class Coin < ApplicationRecord
  #api_key, api_name, api_symbol
  has_many :transactions
  # has_many :wallet_coins #CHECK
  def value
    #return api value
  end

  def self.create_from_api(apikey)
    if not Coin.exists?(api_key: apikey)
      response = Excon.get("https://api.coingecko.com/api/v3/coins/#{apikey}")
      return nil if response.status != 200
      totalInformation =  JSON.parse(response.body)
      nuevaMoneda =  Coin.create(api_key: apikey, api_name: totalInformation["symbol"], api_symbol: totalInformation["name"])
      return nuevaMoneda.id
    end
    return Coin.find_by(api_key: apikey).id
  end

end
