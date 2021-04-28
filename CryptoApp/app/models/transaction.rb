class Transaction < ApplicationRecord
  validates_with NewTransactionValidator
  # CBought_apikey, CBvalue, CBamount
  # CS_apikey, CSvalue, CSamount
  # Date
  belongs_to :wallet, foreign_key:'wallet_id'
  belongs_to :CBought, class_name: 'Coin', :foreign_key => 'CBought_id'
  belongs_to :CSold, class_name: 'Coin', :foreign_key => 'CSold_id'


  def to_s
    "ID: #{id}, CB: #{self.CB_apikey}, CB_A-V: #{self.CB_amount}-#{self.CB_value} | CS: #{self.CS_apikey}, CS_A-V: #{self.CS_amount}-#{self.CS_value}"
  end

  def update_and_validate_wallet
    response = self.wallet.update_coins_after_transaction_new(self.CBought, self.CB_amount, self.CSold, self.CS_amount)
    puts response
    if response == false
      puts "ERRORRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR"
      self.errors.add :CSold, "Not enough amount of sold coin"
    end
  end


  def update_values(transaction_params)
    self.wallet.downgrade_former_values(self.CBought, self.CB_amount, self.CSold, self.CS_amount)
    self.update(transaction_params)
    return true
  end

end
