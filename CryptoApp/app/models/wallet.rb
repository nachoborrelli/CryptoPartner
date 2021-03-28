class Wallet < ApplicationRecord
  belongs_to :user,foreign_key: 'user_id'
  has_many :transaction, reverse_of: :wallet
  has_many :coin
  
end
