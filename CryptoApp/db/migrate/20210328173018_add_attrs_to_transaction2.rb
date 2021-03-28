class AddAttrsToTransaction2 < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :coin, null: false ,foreign_key: true
    add_reference :transactions, :coin, null: false ,foreign_key: true
    add_reference :transactions, :wallet, null: false ,foreign_key: true
  end
end
