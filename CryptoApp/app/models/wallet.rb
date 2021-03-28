class Wallet < ApplicationRecord
  belongs_to :user,foreign_key: 'user_id'
  has_many :transaction, reverse_of: :wallet
  has_many :coin

  def add_coins
    #TODO esta operacion marca el agregado de monedas a una billetera, para usarse cuando
    # se compran cripto a partir de fiats ( monedas fisicas )
  end
  
  def sell_coin
    #TODO esta operacion se utiliza cuando en una transaccion se vende una moneda
  end
  
  def buy_coin
    #TODO esta operacion se utiliza cuando en una transaccion se compra una moneda
  end
end
