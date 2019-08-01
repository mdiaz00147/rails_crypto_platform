class CreateVaults < ActiveRecord::Migration[5.1]
  def change
    create_table :vaults do |t|
      t.integer :user_id
      t.decimal   :amount, default: 0, precision: 20, scale: 2
      t.decimal   :total_rewards, default: 0, precision: 20, scale: 2
      t.decimal   :total_withdrawals, default: 0, precision: 20, scale: 2
      t.decimal   :incentive_comissions, default: 0, precision: 20, scale: 2
      t.decimal  :direct_comissions, default: 0, precision: 20, scale: 2
      t.decimal  :binary_comissions, default: 0, precision: 20, scale: 2
      t.decimal  :residual_comissions, default: 0, precision: 20, scale: 2
      t.integer :lock_version
      t.timestamps

      t.index :user_id, unique: true
    end
  end
end
