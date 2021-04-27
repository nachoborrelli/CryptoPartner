class Wallet < ApplicationRecord
  belongs_to :user,foreign_key: 'user_id'
  has_many :transactions, inverse_of: :wallet
  has_many :wallet_coins, inverse_of: :wallet


  def retrieve_WCoin(coin)
    if self.wallet_coins.exists?(coin_id: coin.id)
      self.wallet_coins.find_by(coin_id: coin.id)
    else
      newWC = WalletCoin.new(wallet_id: self.id, coin_id: coin.id, amount: 0)
      newWC.save()

      puts newWC.id
    end
  end

  def update_coins_after_transaction_new(cBough, cBAmount, cSold, cSAmount)
    cs = retrieve_WCoin(cSold)
    if cs.amount - cSAmount < 0
      puts "jaja"      #Como le aviso al usuario que no le alcanza?
    else
      cs.amount = cs.amount - cSAmount
    end

    cb = retrieve_WCoin(cBough)
    cb.amount = cb.amount + cBAmount

    cs.save()
    cb.save()


  end


  def downgrade_former_values(cBought, cB_amount, cSold, cS_amount)
    cb = retrieve_WCoin(cBought)
    cs = retrieve_WCoin(cSold)

    cb.amount = cb.amount - cB_amount
    cs.amount = cs.amount + cS_amount

    cs.save()
    cb.save()

  end

end
