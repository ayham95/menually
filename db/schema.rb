# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_16_175501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "businesses", force: :cascade do |t|
    t.string "nameAr"
    t.string "nameEn"
    t.string "logo"
    t.string "theme"
    t.string "managerPhone"
    t.string "wifiPassword"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider", default: "phone", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "email"
    t.json "tokens"
    t.index ["current_sign_in_at"], name: "index_businesses_on_current_sign_in_at"
    t.index ["email"], name: "index_businesses_on_email"
    t.index ["reset_password_token"], name: "index_businesses_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_businesses_on_uid_and_provider", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "business_id", null: false
    t.string "nameEn"
    t.string "nameAr"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_id"], name: "index_categories_on_business_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "nameEn"
    t.string "nameAr"
    t.string "image"
    t.string "descriptionEn"
    t.string "descriptionAr"
    t.string "preparationTime"
    t.float "price"
    t.integer "position"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "image"
    t.string "titleEn"
    t.string "titleAr"
    t.string "descriptionEn"
    t.string "descriptionAr"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "business_id", null: false
    t.index ["business_id"], name: "index_offers_on_business_id"
  end

  add_foreign_key "categories", "businesses"
  add_foreign_key "items", "categories"
  add_foreign_key "offers", "businesses"
end
