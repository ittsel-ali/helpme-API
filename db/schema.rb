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

ActiveRecord::Schema.define(version: 2018_11_11_001210) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acknowledged_posts", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "visitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_acknowledged_posts_on_post_id"
    t.index ["visitor_id"], name: "index_acknowledged_posts_on_visitor_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code"
    t.boolean "redeemed?", default: false, null: false
    t.string "couponable_type"
    t.bigint "couponable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["couponable_type", "couponable_id"], name: "index_coupons_on_couponable_type_and_couponable_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "file"
    t.string "image_type"
    t.string "imagable_type"
    t.bigint "imagable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imagable_type", "imagable_id"], name: "index_images_on_imagable_type_and_imagable_id"
  end

  create_table "nearby_places", force: :cascade do |t|
    t.string "google_place_id"
    t.string "google_place_lat"
    t.string "google_place_lng"
    t.bigint "user_location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_location_id"], name: "index_nearby_places_on_user_location_id"
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer "resource_owner_id"
    t.integer "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "places", force: :cascade do |t|
    t.string "placeable_type"
    t.bigint "placeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["placeable_type", "placeable_id"], name: "index_places_on_placeable_type_and_placeable_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "text"
    t.string "price"
    t.bigint "visitor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["visitor_id"], name: "index_posts_on_visitor_id"
  end

  create_table "registered_places", force: :cascade do |t|
    t.string "name"
    t.string "lat"
    t.string "lng"
    t.string "google_place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_locations", force: :cascade do |t|
    t.string "lat"
    t.string "lng"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_locations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visitors", force: :cascade do |t|
    t.boolean "active?", default: false, null: false
    t.bigint "user_location_id"
    t.bigint "registered_place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registered_place_id"], name: "index_visitors_on_registered_place_id"
    t.index ["user_location_id"], name: "index_visitors_on_user_location_id"
  end

  add_foreign_key "oauth_access_tokens", "users", column: "resource_owner_id"
end
