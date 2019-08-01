class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uuid
      t.string :parent_uuid
      t.boolean :right, default: true
      t.boolean :active, default: false
      t.boolean :temp_user, default: true
      t.boolean :active_binary, default: false
      t.boolean :withdrawals_enabled, default: true
      t.boolean :left_son, default: true
      t.string :username
      t.string :name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :document
      t.string :country
      t.string :city
      t.string :address
      t.string :country_iso
      t.string :last_ip
      t.string :btc_wallet
      t.string :ltc_wallet
      t.string :otp_secret_key
      t.string :ancestry, limit: 512
      t.integer :ancestry_depth, default: 0
      t.boolean :enabled_google_authenticator, default: false
      t.datetime :deleted_at
      t.datetime :last_login
      t.boolean :admin, default: false
      t.boolean :left_parent_bak
      t.attachment :avatar
      t.integer :lock_version
      t.timestamps
      
      t.index :ancestry
      t.index :username, unique: true
      t.index :uuid
    end
  end
end
