class AddColumnToVault < ActiveRecord::Migration[5.1]
  def change
    add_column :vaults, :amount_fast, :decimal, default: 0, precision: 20, scale: 2
    
  end
end
