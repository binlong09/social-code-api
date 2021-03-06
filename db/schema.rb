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

ActiveRecord::Schema.define(version: 2019_11_20_042802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "study_group_bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "study_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_group_id", "user_id"], name: "index_study_group_bookmarks_on_study_group_id_and_user_id", unique: true
    t.index ["study_group_id"], name: "index_study_group_bookmarks_on_study_group_id"
    t.index ["user_id"], name: "index_study_group_bookmarks_on_user_id"
  end

  create_table "study_group_comments", force: :cascade do |t|
    t.text "content", null: false
    t.string "image_url"
    t.bigint "study_group_post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_group_post_id"], name: "index_study_group_comments_on_study_group_post_id"
    t.index ["user_id"], name: "index_study_group_comments_on_user_id"
  end

  create_table "study_group_memberships", force: :cascade do |t|
    t.bigint "study_group_id"
    t.bigint "user_id"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_group_id", "user_id"], name: "index_study_group_memberships_on_study_group_id_and_user_id", unique: true
    t.index ["study_group_id"], name: "index_study_group_memberships_on_study_group_id"
    t.index ["user_id"], name: "index_study_group_memberships_on_user_id"
  end

  create_table "study_group_posts", force: :cascade do |t|
    t.bigint "study_group_id"
    t.bigint "user_id"
    t.text "content", null: false
    t.string "image_url"
    t.integer "comments_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_group_id"], name: "index_study_group_posts_on_study_group_id"
    t.index ["user_id"], name: "index_study_group_posts_on_user_id"
  end

  create_table "study_groups", force: :cascade do |t|
    t.string "class_code", null: false
    t.string "study_group_name", null: false
    t.string "location"
    t.integer "semester", default: 0
    t.datetime "meeting_time", null: false
    t.string "professor_name"
    t.integer "going_count", default: 0
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_count", default: 0
    t.integer "bookmark_count", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone_number"
    t.string "graduation_date"
    t.string "major"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_url"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "study_group_bookmarks", "study_groups"
  add_foreign_key "study_group_bookmarks", "users"
  add_foreign_key "study_group_comments", "study_group_posts"
  add_foreign_key "study_group_comments", "users"
  add_foreign_key "study_group_memberships", "study_groups"
  add_foreign_key "study_group_memberships", "users"
  add_foreign_key "study_group_posts", "study_groups"
  add_foreign_key "study_group_posts", "users"
end
