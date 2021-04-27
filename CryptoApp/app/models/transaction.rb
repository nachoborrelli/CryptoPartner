class Transaction < ApplicationRecord
  # CBought_apikey, CBvalue, CBamount
  # CS_apikey, CSvalue, CSamount
  # Date
  belongs_to :wallet, foreign_key:'wallet_id'
  belongs_to :CBought, class_name: 'Coin', :foreign_key => 'CBought_id'
  belongs_to :CSold, class_name: 'Coin', :foreign_key => 'CSold_id'

  after_save :update_wallet_for_new

  def update_wallet_for_new
    self.wallet.update_coins_after_transaction_new(self.CBought, self.CB_amount, self.CSold, self.CS_amount)
  end


  def update_values(transaction_params)
    self.wallet.downgrade_former_values(self.CBought, self.CB_amount, self.CSold, self.CS_amount)
    self.update(transaction_params)
    return true
  end

end
