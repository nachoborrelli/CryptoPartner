class AddAttrsToTransaction2 < ActiveRecord::Migration[6.1]
  def change
    add_reference :transactions, :wallet, null: false ,foreign_key: true
    change_table(:transactions) do |t|
      t.references :CBought, foreign_key: { to_table: 'coins' }
      t.references :CSold, foreign_key: { to_table: 'coins' }
    end
  end
end
