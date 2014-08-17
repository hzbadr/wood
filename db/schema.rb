# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140817183510) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.text     "description"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id", using: :btree

  create_table "currencies", force: true do |t|
    t.string   "name"
    t.string   "sign"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currency_exchanges", force: true do |t|
    t.integer  "safe_id"
    t.integer  "source_id"
    t.decimal  "source_amount",      precision: 10, scale: 0
    t.integer  "destination_id"
    t.decimal  "destination_amount", precision: 10, scale: 0
    t.decimal  "exchange_rate",      precision: 10, scale: 0
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "currency_exchanges", ["destination_id"], name: "index_currency_exchanges_on_destination_id", using: :btree
  add_index "currency_exchanges", ["safe_id"], name: "index_currency_exchanges_on_safe_id", using: :btree
  add_index "currency_exchanges", ["source_id"], name: "index_currency_exchanges_on_source_id", using: :btree

  create_table "line_items", force: true do |t|
    t.integer  "product_id"
    t.decimal  "quantity",   precision: 8, scale: 2
    t.decimal  "price",      precision: 8, scale: 2
    t.decimal  "cost_price", precision: 8, scale: 2
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "number"
    t.decimal  "total",         precision: 10, scale: 0
    t.string   "state"
    t.integer  "customer_id"
    t.datetime "completed_at"
    t.integer  "created_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["created_by_id"], name: "index_orders_on_created_by_id", using: :btree
  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id", using: :btree

  create_table "payment_methods", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.decimal  "amount",            precision: 8, scale: 2
    t.integer  "user_id"
    t.string   "state"
    t.integer  "payment_method_id"
    t.integer  "payable_id"
    t.string   "payable_type"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["payment_method_id"], name: "index_payments_on_payment_method_id", using: :btree
  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "products", force: true do |t|
    t.decimal  "weight",       precision: 8, scale: 2
    t.decimal  "width",        precision: 8, scale: 2
    t.decimal  "height",       precision: 8, scale: 2
    t.decimal  "depth",        precision: 8, scale: 2
    t.integer  "category_id"
    t.integer  "warehouse_id"
    t.decimal  "cost_price",   precision: 8, scale: 2
    t.decimal  "price",        precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["warehouse_id"], name: "index_products_on_warehouse_id", using: :btree

  create_table "saves", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "account_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_transfers", force: true do |t|
    t.integer  "source_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stock_transfers", ["product_id"], name: "index_stock_transfers_on_product_id", using: :btree
  add_index "stock_transfers", ["source_id"], name: "index_stock_transfers_on_source_id", using: :btree

  create_table "stocks", force: true do |t|
    t.integer  "product_id"
    t.decimal  "quantity",   precision: 8, scale: 2
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stocks", ["product_id"], name: "index_stocks_on_product_id", using: :btree

  create_table "transactions", force: true do |t|
    t.decimal  "amount",           precision: 10, scale: 0
    t.integer  "currency_id"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "destination_id"
    t.string   "destination_type"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.text     "address"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "warehouses", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
