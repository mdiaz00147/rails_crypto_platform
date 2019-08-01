class CreatePoints < ActiveRecord::Migration[5.1]
  def change
    create_table :points do |t|
      t.integer :user_id
      t.integer :left_points, default: 0
      t.integer :right_points, default: 0
      t.integer :diff, default: 0
      t.integer :left_total_points, default: 0
      t.integer :right_total_points, default: 0
      t.integer :lock_version
      t.timestamps

      t.index :user_id, unique: true
    end
  end
end
