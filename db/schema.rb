# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190625182940) do

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.integer "decimals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_currencies_on_code", unique: true
  end

  create_table "invoices", force: :cascade do |t|
    t.string "uuid"
    t.decimal "price", precision: 20, scale: 8, default: "0.0"
    t.decimal "fees", precision: 20, scale: 8, default: "0.0"
    t.string "wallet"
    t.string "txid"
    t.integer "currency_id"
    t.integer "invoice_status", default: 0
    t.integer "user_id"
    t.integer "plan_id"
    t.string "blokio_notification_id"
    t.integer "lock_version"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 20, scale: 8, default: "0.0"
    t.decimal "fees", precision: 20, scale: 8, default: "0.0"
    t.integer "expiration_days"
    t.decimal "daily_percent", precision: 20, scale: 8, default: "0.0"
    t.boolean "active", default: true
    t.integer "code"
    t.integer "point", default: 0
    t.boolean "subscription", default: false
    t.decimal "unilevel_percent_1", precision: 20, scale: 2, default: "0.0"
    t.decimal "unilevel_percent_2", precision: 20, scale: 2, default: "0.0"
    t.decimal "unilevel_percent_3", precision: 20, scale: 2, default: "0.0"
    t.decimal "unilevel_percent_4", precision: 20, scale: 2, default: "0.0"
    t.decimal "unilevel_percent_5", precision: 20, scale: 2, default: "0.0"
    t.decimal "residual_depth", precision: 20, scale: 2, default: "0.0"
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_plans_on_code", unique: true
  end

  create_table "points", force: :cascade do |t|
    t.integer "user_id"
    t.integer "left_points", default: 0
    t.integer "right_points", default: 0
    t.integer "diff", default: 0
    t.integer "left_total_points", default: 0
    t.integer "right_total_points", default: 0
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_points_on_user_id", unique: true
  end

  create_table "rewards", force: :cascade do |t|
    t.string "uuid"
    t.decimal "value", precision: 20, scale: 8, default: "0.0"
    t.integer "currency_id"
    t.integer "user_id"
    t.integer "subscription_id"
    t.integer "reward_status", default: 0
    t.integer "reward_type", default: 0
    t.datetime "deleted_at"
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_rewards_on_subscription_id"
    t.index ["user_id"], name: "index_rewards_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "uuid"
    t.integer "user_id"
    t.integer "plan_id"
    t.integer "invoice_id"
    t.integer "subscription_status", default: 0
    t.datetime "expiration"
    t.datetime "deleted_at"
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "payments_enabled", default: true
    t.index ["invoice_id"], name: "index_subscriptions_on_invoice_id", unique: true
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid"
    t.string "parent_uuid"
    t.boolean "right", default: true
    t.boolean "active", default: false
    t.boolean "temp_user", default: true
    t.boolean "active_binary", default: false
    t.boolean "withdrawals_enabled", default: true
    t.boolean "left_son", default: true
    t.string "username"
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.string "document"
    t.string "country"
    t.string "city"
    t.string "address"
    t.string "country_iso"
    t.string "last_ip"
    t.string "btc_wallet"
    t.string "ltc_wallet"
    t.string "otp_secret_key"
    t.string "ancestry", limit: 512
    t.integer "ancestry_depth", default: 0
    t.boolean "enabled_google_authenticator", default: false
    t.datetime "deleted_at"
    t.datetime "last_login"
    t.boolean "admin", default: false
    t.boolean "left_parent_bak"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_users_on_ancestry"
    t.index ["username"], name: "index_users_on_username", unique: true
    t.index ["uuid"], name: "index_users_on_uuid"
  end

  create_table "vaults", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "amount", precision: 20, scale: 2, default: "0.0"
    t.decimal "total_rewards", precision: 20, scale: 2, default: "0.0"
    t.decimal "total_withdrawals", precision: 20, scale: 2, default: "0.0"
    t.decimal "incentive_comissions", precision: 20, scale: 2, default: "0.0"
    t.decimal "direct_comissions", precision: 20, scale: 2, default: "0.0"
    t.decimal "binary_comissions", precision: 20, scale: 2, default: "0.0"
    t.decimal "residual_comissions", precision: 20, scale: 2, default: "0.0"
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount_fast", precision: 20, scale: 2, default: "0.0"
    t.index ["user_id"], name: "index_vaults_on_user_id", unique: true
  end

  create_table "withdrawals", force: :cascade do |t|
    t.string "uuid"
    t.integer "user_id"
    t.float "settle"
    t.float "value"
    t.float "fees"
    t.text "comments"
    t.string "wallet"
    t.integer "currency_id"
    t.string "txid"
    t.string "ticker", default: "0"
    t.integer "lock_version"
    t.string "withdrawal_uniq"
    t.integer "withdrawal_status", default: 0
    t.integer "withdrawal_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["user_id"], name: "index_withdrawals_on_user_id"
    t.index ["withdrawal_uniq"], name: "index_withdrawals_on_withdrawal_uniq", unique: true
  end

end
