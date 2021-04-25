class CreateWalletCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :wallet_coins do |t|
      t.float :amount
      t.references :wallet, index: true
      t.references :coin, index: true
      t.timestamps
    end
  end
end
