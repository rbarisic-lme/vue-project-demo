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

ActiveRecord::Schema.define(version: 2021_05_21_184620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "allowlisted_jwts", force: :cascade do |t|
    t.string "jti", null: false
    t.string "aud"
    t.datetime "exp", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jti"], name: "index_allowlisted_jwts_on_jti", unique: true
    t.index ["user_id"], name: "index_allowlisted_jwts_on_user_id"
  end

  create_table "available_extras", force: :cascade do |t|
    t.bigint "service_extra_id"
    t.bigint "user_id"
    t.decimal "price", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_extra_id"], name: "index_available_extras_on_service_extra_id"
    t.index ["user_id"], name: "index_available_extras_on_user_id"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string "full_name"
    t.string "street"
    t.string "zipcode"
    t.string "city"
    t.string "country"
    t.string "iban"
    t.string "bic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "encrypted_iban"
    t.string "encrypted_iban_iv"
    t.index ["owner_type", "owner_id"], name: "index_bank_accounts_on_owner"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "brands_users", force: :cascade do |t|
    t.bigint "brand_id"
    t.bigint "user_id"
    t.index ["brand_id"], name: "index_brands_users_on_brand_id"
    t.index ["user_id"], name: "index_brands_users_on_user_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "street"
    t.string "zipcode"
    t.string "country"
    t.string "legal_form"
    t.string "tax_id"
    t.string "vat"
    t.integer "tax_rate", default: 19
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "certifications", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.text "body"
    t.string "certified_by"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_certifications_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name", null: false
    t.string "iso2"
    t.string "iso3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_languages_on_name", unique: true
  end

  create_table "languages_users", force: :cascade do |t|
    t.bigint "language_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_languages_users_on_language_id"
    t.index ["user_id"], name: "index_languages_users_on_user_id"
  end

  create_table "portfolio_images", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_portfolio_images_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "author"
    t.string "email"
    t.text "body"
    t.decimal "rating_quality"
    t.decimal "rating_timeliness"
    t.decimal "rating_communication"
    t.decimal "overall_rating"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "email_confirmed_at"
    t.string "email_verification_token"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "service_extras", force: :cascade do |t|
    t.string "name"
    t.boolean "requires_trial_date", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_skills_on_user_id"
  end

  create_table "static_pages", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "street"
    t.string "city"
    t.string "zipcode"
    t.string "country"
    t.string "phone"
    t.string "address_latitude"
    t.string "address_longitude"
    t.text "about_me"
    t.integer "service_radius"
    t.decimal "service_package_basic_hair_price"
    t.decimal "service_package_basic_makeup_price"
    t.decimal "service_package_standard_price"
    t.decimal "service_package_premium_price"
    t.string "role"
    t.string "type"
    t.string "workspace_street"
    t.string "workspace_city"
    t.string "workspace_zipcode"
    t.string "workspace_country"
    t.boolean "stylist_tutorial_read", default: false
    t.datetime "kyc_verified_at"
    t.datetime "kyc_updated_at"
    t.datetime "kyc_denied_at"
    t.string "kyc_verified_with_workflow"
    t.decimal "sustainable_materials_percent"
    t.boolean "service_mobility"
    t.string "provider"
    t.string "uid"
    t.boolean "invoice_mandate_accepted"
    t.string "md5_identifier"
    t.boolean "profile_published", default: false
    t.boolean "kyc_pending"
    t.string "kyc_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "allowlisted_jwts", "users", on_delete: :cascade
  add_foreign_key "certifications", "users"
  add_foreign_key "portfolio_images", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "skills", "users"
end
