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

ActiveRecord::Schema[8.0].define(version: 2025_04_12_003312) do
  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "size"
    t.float "caffeine"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_configurations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "prefered_unit"
    t.float "threshold"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "max_per_day"
    t.index ["user_id"], name: "index_user_configurations_on_user_id"
  end

  create_table "user_drinks", force: :cascade do |t|
    t.integer "drink_id", null: false
    t.integer "user_id", null: false
    t.integer "level"
    t.datetime "consumed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drink_id"], name: "index_user_drinks_on_drink_id"
    t.index ["user_id"], name: "index_user_drinks_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_configurations", "users"
  add_foreign_key "user_drinks", "drinks"
  add_foreign_key "user_drinks", "users"
  add_foreign_key "user_roles", "users"
end
