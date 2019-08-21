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

ActiveRecord::Schema.define(version: 2019_08_21_062420) do

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "ages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "decade"
  end

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.string "image_01"
    t.string "image_02"
    t.string "image_03"
    t.string "image_04"
    t.string "blog_image_name"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.string "photo_file_size"
    t.string "photo_updated_at"
    t.string "photo"
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ruby"
    t.string "icon"
    t.string "order"
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "group"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kana"
    t.string "group"
    t.string "order"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "day"
    t.string "venue"
    t.datetime "date"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_name"
    t.string "line_id"
    t.string "switch"
    t.string "item"
    t.string "prefecture"
    t.string "area"
    t.string "schedule"
    t.string "age"
    t.string "recruitment"
    t.string "foundation"
    t.string "member"
    t.string "average_age"
    t.string "cost"
    t.string "web"
    t.text "appeal"
    t.string "password"
    t.string "goal"
    t.integer "prefecture_id"
    t.string "user_id"
    t.string "event_id"
    t.integer "decade_age"
    t.string "header_image"
    t.string "pic_profile"
    t.string "pic_header"
    t.string "last_post"
    t.string "grouping"
    t.string "gallery_01"
    t.string "gallery_02"
    t.string "gallery_03"
    t.string "gallery_04"
    t.index ["prefecture_id"], name: "index_users_on_prefecture_id"
  end

end
