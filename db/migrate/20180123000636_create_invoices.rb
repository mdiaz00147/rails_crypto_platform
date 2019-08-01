class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.string :uuid
      t.decimal :price, default: 0, precision: 20, scale: 8
      t.decimal :fees, default: 0, precision: 20, scale: 8
      t.string :wallet
      t.string :txid
      t.integer :currency_id
      t.integer :invoice_status, default: 0
      t.integer :user_id
      t.integer :plan_id
      t.string :blokio_notification_id
      t.integer :lock_version
      t.datetime :deleted_at
      t.timestamps

      t.index :user_id
    end
  end
end
