class Transaction < ApplicationRecord
  # CBought_apikey, CBvalue, CBamount
  # CS_apikey, CSvalue, CSamount
  # Date
  belongs_to :wallet, foreign_key:'wallet_id'
  belongs_to :CBought, class_name: 'Coin', :foreign_key => 'CBought_id'
  belongs_to :CSold, class_name: 'Coin', :foreign_key => 'CSold_id'

  after_save :update_wallet

  def update_wallet
    self.wallet.update_coins_after_transaction(self.CBought, self.CB_amount, self.CSold, self.CS_amount)
  end

end
