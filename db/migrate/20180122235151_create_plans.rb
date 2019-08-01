class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.text  :description
      t.decimal :price, default: 0, precision: 20, scale: 8
      t.decimal :fees, default: 0, precision: 20, scale: 8
      t.integer :expiration_days
      t.decimal :daily_percent, default: 0, precision: 20, scale: 8
      t.boolean :active, default: true
      t.integer :code
      t.integer :point, default: 0
      t.boolean :subscription, default: false
      t.decimal :unilevel_percent_1, default: 0, precision: 20, scale: 2
      t.decimal :unilevel_percent_2, default: 0, precision: 20, scale: 2
      t.decimal :unilevel_percent_3, default: 0, precision: 20, scale: 2
      t.decimal :unilevel_percent_4, default: 0, precision: 20, scale: 2
      t.decimal :unilevel_percent_5, default: 0, precision: 20, scale: 2
      t.decimal :residual_depth, default: 0, precision: 20, scale: 2
      t.integer :lock_version
      t.timestamps

      t.index :code, unique: true
    end
  end
end
