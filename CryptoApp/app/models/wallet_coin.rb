class WalletCoin < ApplicationRecord
  belongs_to :wallet ,foreign_key: 'wallet_id'
  belongs_to :coin, foreign_key: 'coin_id'
end
