class Addcolumntowiithdrawals < ActiveRecord::Migration[5.1]
  def change
    add_column :withdrawals, :deleted_at, :datetime

  end
end
