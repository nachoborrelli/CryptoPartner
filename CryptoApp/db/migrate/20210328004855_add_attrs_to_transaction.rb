class AddAttrsToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :CB_apikey, :string
    add_column :transactions, :CB_value, :float
    add_column :transactions, :CS_apikey, :string
    add_column :transactions, :CS_value, :float
    add_column :transactions, :date, :datetime
  end
end
