class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.string :uuid
      t.integer :user_id
      t.integer :plan_id
      t.integer :invoice_id
      t.integer :subscription_status, default: 0
      t.datetime :expiration
      t.datetime :deleted_at
      t.integer :lock_version
      t.timestamps

      t.index :user_id
      t.index :invoice_id, unique: true
    end
  end
end
