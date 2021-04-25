class Coin < ApplicationRecord
  #api_key, api_name, api_symbol
  has_many :transactions
  # has_many :wallet_coins #CHECK
  def value
    #return api value
  end

end
