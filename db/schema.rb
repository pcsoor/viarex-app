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

ActiveRecord::Schema.define(version: 2022_05_30_162042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board_edges", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "board_types", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "boards", force: :cascade do |t|
    t.bigint "board_type_id"
    t.bigint "order_item_id", null: false
    t.bigint "banding_long_1_id"
    t.bigint "banding_long_2_id"
    t.bigint "banding_short_1_id"
    t.bigint "banding_short_2_id"
    t.boolean "vein"
    t.decimal "width"
    t.decimal "length"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["banding_long_1_id"], name: "index_boards_on_banding_long_1_id"
    t.index ["banding_long_2_id"], name: "index_boards_on_banding_long_2_id"
    t.index ["banding_short_1_id"], name: "index_boards_on_banding_short_1_id"
    t.index ["banding_short_2_id"], name: "index_boards_on_banding_short_2_id"
    t.index ["board_type_id"], name: "index_boards_on_board_type_id"
    t.index ["order_item_id"], name: "index_boards_on_order_item_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.integer "quantity"
    t.text "notice"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "ordered_at"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boards", "board_edges", column: "banding_long_1_id"
  add_foreign_key "boards", "board_edges", column: "banding_long_2_id"
  add_foreign_key "boards", "board_edges", column: "banding_short_1_id"
  add_foreign_key "boards", "board_edges", column: "banding_short_2_id"
  add_foreign_key "boards", "board_types"
  add_foreign_key "boards", "order_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "users"
end
