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

ActiveRecord::Schema[8.0].define(version: 2024_11_14_021704) do
  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  create_table "deliveries", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "date", default: "2024-11-14 02:24:30"
    t.bigint "motorized_id", null: false
    t.bigint "clerk_id", null: false
    t.index ["clerk_id"], name: "index_deliveries_on_clerk_id"
    t.index ["motorized_id"], name: "index_deliveries_on_motorized_id"
  end

  create_table "payments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cashier_id_id", null: false
    t.integer "total", null: false
    t.datetime "created_at", default: "2024-11-14 02:24:30"
    t.string "data"
    t.bigint "sale_id", null: false
    t.index ["cashier_id_id"], name: "index_payments_on_cashier_id_id"
    t.index ["sale_id"], name: "index_payments_on_sale_id"
  end

  create_table "people", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "dni", limit: 8, null: false
    t.string "name", limit: 200
    t.string "address", limit: 200
    t.string "phone", limit: 12
    t.bigint "role_id", null: false
    t.index ["role_id"], name: "index_people_on_role_id"
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 150, null: false
    t.string "description", limit: 300, null: false
    t.string "price", null: false
    t.integer "stock_actual", default: 100, null: false
    t.integer "stock_min", default: 10, null: false
    t.bigint "subcategory_id", null: false
    t.index ["subcategory_id"], name: "index_products_on_subcategory_id"
  end

  create_table "roles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50, null: false
  end

  create_table "sale_packages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "delivery_at", null: false
    t.string "address", null: false
    t.string "status", null: false
    t.bigint "sale_id", null: false
    t.bigint "delivery_id", null: false
    t.bigint "store_id", null: false
    t.index ["delivery_id"], name: "index_sale_packages_on_delivery_id"
    t.index ["sale_id"], name: "index_sale_packages_on_sale_id"
    t.index ["store_id"], name: "index_sale_packages_on_store_id"
  end

  create_table "sales", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "amount", null: false
    t.string "status", null: false
    t.bigint "customer_id", null: false
    t.bigint "storekeeper_id", null: false
    t.index ["customer_id"], name: "index_sales_on_customer_id"
    t.index ["storekeeper_id"], name: "index_sales_on_storekeeper_id"
  end

  create_table "sales_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "quantity", default: 1
    t.integer "amount", null: false
    t.bigint "sample_id", null: false
    t.bigint "sale_id", null: false
    t.index ["sale_id"], name: "index_sales_details_on_sale_id"
    t.index ["sample_id"], name: "index_sales_details_on_sample_id"
  end

  create_table "samples", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "batch_number"
    t.date "production_date"
    t.date "expiry_date"
    t.bigint "product_id", null: false
    t.index ["product_id"], name: "index_samples_on_product_id"
  end

  create_table "stores", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "address"
  end

  create_table "subcategories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "password", null: false
    t.bigint "person_id", null: false
    t.index ["person_id"], name: "index_users_on_person_id"
  end

  add_foreign_key "deliveries", "people", column: "clerk_id"
  add_foreign_key "deliveries", "people", column: "motorized_id"
  add_foreign_key "payments", "people", column: "cashier_id_id"
  add_foreign_key "payments", "sales"
  add_foreign_key "people", "roles"
  add_foreign_key "products", "subcategories"
  add_foreign_key "sale_packages", "deliveries"
  add_foreign_key "sale_packages", "sales"
  add_foreign_key "sale_packages", "stores"
  add_foreign_key "sales", "people", column: "customer_id"
  add_foreign_key "sales", "people", column: "storekeeper_id"
  add_foreign_key "sales_details", "sales"
  add_foreign_key "sales_details", "samples"
  add_foreign_key "samples", "products"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "users", "people"
end
