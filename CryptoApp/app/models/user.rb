class User < ApplicationRecord
  has_one :wallet, dependent: :destroy, inverse_of: :user
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  after_create :create_wallet

  def create_global
    self.wallet.create()
  end
end
