class AddcOluMntoSubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :payments_enabled, :boolean, default: true
  end
end
