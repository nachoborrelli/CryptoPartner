class AddAmountsTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :CB_amount, :float
    add_column :transactions, :CS_amount, :float
  end
end
