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

ActiveRecord::Schema.define(version: 2019_06_11_225841) do

  create_table "climbs", force: :cascade do |t|
    t.integer "number_of_climbs"
    t.integer "rope_id"
    t.integer "takedown_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.string "commentable_type"
    t.integer "commentable_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "elements", force: :cascade do |t|
    t.string "name"
    t.integer "site_id"
    t.text "preuse_equipment_instructions"
    t.text "preuse_element_instructions"
    t.text "preuse_environment_instructions"
    t.text "periodic_equipment_instructions"
    t.text "periodic_element_instructions"
    t.text "periodic_environment_instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "periodic_inspections", force: :cascade do |t|
    t.boolean "equipment_complete"
    t.boolean "element_complete"
    t.boolean "environment_complete"
    t.integer "element_id"
    t.integer "user_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preuse_inspections", force: :cascade do |t|
    t.integer "element_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ropes", force: :cascade do |t|
    t.string "identifier"
    t.integer "element_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "setups", force: :cascade do |t|
    t.boolean "equipment_complete"
    t.boolean "element_complete"
    t.boolean "environment_complete"
    t.integer "preuse_inspection_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
  end

  create_table "takedowns", force: :cascade do |t|
    t.boolean "equipment_complete"
    t.boolean "element_complete"
    t.boolean "environment_complete"
    t.integer "preuse_inspection_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_setups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "setup_id"
  end

  create_table "user_takedownsses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "takedown_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fullname"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.integer "site_id"
  end

end
