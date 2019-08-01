class CreateRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards do |t|
      t.string :uuid
      t.decimal   :value, default: 0, precision: 20, scale: 8
      t.integer :currency_id
      t.integer :user_id
      t.integer :subscription_id
      t.integer :reward_status, default: 0
      t.integer :reward_type, default: 0
      t.datetime :deleted_at
      t.integer :lock_version
      t.timestamps

      t.index :user_id
      t.index :subscription_id
    end
  end
end
