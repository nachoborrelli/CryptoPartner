class AddAttrsToCoin < ActiveRecord::Migration[6.1]
  def change
    add_column :coins, :api_key, :string
    add_column :coins, :api_name, :string
    add_column :coins, :api_symbol, :string

  end
end
