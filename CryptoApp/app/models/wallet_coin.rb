class WalletCoin < ApplicationRecord
  belongs_to :wallet ,foreign_key: 'wallet_id'
  belongs_to :coin, foreign_key: 'coin_id'

  def to_s
    "Coin: #{coin.api_key}, Amount: #{amount}"
  end

  def api_key
    coin.api_key
  end

  def api_name
    coin.api_name
  end
end
