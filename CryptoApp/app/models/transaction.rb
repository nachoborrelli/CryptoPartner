class Transaction < ApplicationRecord
  # CBought, CBought_apikey, CBvalue
  # CSold, CS_apikey, CSvalue
  # Date, (?)
  belongs_to :wallet, foreing_key:'wallet_id'
  #TODO has_one :coin, 

end
