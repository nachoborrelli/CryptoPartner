class Transaction < ApplicationRecord
  # CBought_apikey, CBvalue, CBamount
  # CS_apikey, CSvalue, CSamount
  # Date
  belongs_to :wallet, foreign_key:'wallet_id'
  belongs_to :CBought, class_name: 'Coin', :foreign_key => 'CBought_id'
  belongs_to :CSold, class_name: 'Coin', :foreign_key => 'CSold_id'

  
end
