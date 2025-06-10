# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_09_223124) do
  create_table "chargeable_items", force: :cascade do |t|
    t.integer "value"
    t.bigint "chargeable_id"
    t.string "chargeable_type"
    t.integer "Product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Product_id"], name: "index_chargeable_items_on_Product_id"
    t.index ["chargeable_type", "chargeable_id"], name: "index_chargeable_items_on_chargeable_type_and_chargeable_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "document_type", default: 0
    t.integer "type", default: 0
  end

  create_table "orders", force: :cascade do |t|
    t.integer "Customer_id", null: false
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["Customer_id"], name: "index_orders_on_Customer_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.bigint "payable_id"
    t.string "payable_type"
    t.index ["payable_type", "payable_id"], name: "index_payments_on_payable_type_and_payable_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "Customer_id", null: false
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["Customer_id"], name: "index_subscriptions_on_Customer_id"
  end

  add_foreign_key "chargeable_items", "Products"
  add_foreign_key "orders", "Customers"
  add_foreign_key "subscriptions", "Customers"
end
