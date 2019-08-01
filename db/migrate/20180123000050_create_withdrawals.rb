class CreateWithdrawals < ActiveRecord::Migration[5.1]
  def change
    create_table :withdrawals do |t|
      t.string :uuid
      t.integer :user_id
      t.float :settle
      t.float :value
      t.float :fees
      t.text :comments
      t.string :wallet
      t.integer :currency_id
      t.string :txid
      t.string :ticker, default: 0
      t.integer :lock_version
      t.string :withdrawal_uniq
      t.integer :withdrawal_status, default: 0
      t.integer :withdrawal_type, default: 0
      t.timestamps

      t.index :user_id
      t.index :withdrawal_uniq, unique: true
    end
  end
end
