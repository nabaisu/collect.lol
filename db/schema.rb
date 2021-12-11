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

ActiveRecord::Schema.define(version: 2021_12_11_154838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collectibles", force: :cascade do |t|
    t.string "kind", null: false
    t.string "title", null: false
    t.string "description"
    t.string "photo"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gathers", force: :cascade do |t|
    t.string "time_when"
    t.string "how"
    t.string "link"
    t.string "extra_information"
    t.string "description"
    t.string "condition"
    t.bigint "user_id", null: false
    t.bigint "stickerbook_id", null: false
    t.bigint "zone_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stickerbook_id"], name: "index_gathers_on_stickerbook_id"
    t.index ["user_id"], name: "index_gathers_on_user_id"
    t.index ["zone_id"], name: "index_gathers_on_zone_id"
  end

  create_table "rules", force: :cascade do |t|
    t.string "condition_type"
    t.string "condition"
    t.bigint "stickerbook_id"
    t.bigint "zone_id"
    t.bigint "collectible_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collectible_id"], name: "index_rules_on_collectible_id"
    t.index ["stickerbook_id"], name: "index_rules_on_stickerbook_id"
    t.index ["zone_id"], name: "index_rules_on_zone_id"
  end

  create_table "stickerbooks", force: :cascade do |t|
    t.string "title"
    t.string "created_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.string "email"
    t.string "gender"
    t.string "login"
    t.string "phone"
    t.string "phone_country_code"
    t.boolean "is_anon"
    t.boolean "active"
    t.string "deactivated_reason"
    t.boolean "email_confirmed"
    t.boolean "phone_confirmed"
    t.boolean "account_verified"
    t.datetime "account_verified_time"
    t.string "jwt_token"
    t.datetime "last_login_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "zones", force: :cascade do |t|
    t.string "kind", null: false
    t.string "name", null: false
    t.string "code"
    t.string "capital"
    t.string "subregion"
    t.string "childs_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "gathers", "stickerbooks"
  add_foreign_key "gathers", "users"
  add_foreign_key "gathers", "zones"
  add_foreign_key "rules", "collectibles"
  add_foreign_key "rules", "stickerbooks"
  add_foreign_key "rules", "zones"
end
