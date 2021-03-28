class Coin < ApplicationRecord
  #api_key, api_name, api_symbol
  has_many :transactions
  def value
    #return api value
  end

end
