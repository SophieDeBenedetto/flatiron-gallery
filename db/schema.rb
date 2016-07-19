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

ActiveRecord::Schema.define(version: 20160628185915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collaborations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_collaborations_on_project_id", using: :btree
    t.index ["user_id"], name: "index_collaborations_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "screenshot"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "description"
    t.string   "deployed_url"
    t.string   "github_repos", default: [],              array: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "github"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "personal_site"
    t.string   "blog_url"
    t.boolean  "instructor",          default: false
    t.integer  "cohort_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "bio"
    t.boolean  "email_confirmed",     default: false
    t.string   "confirm_token"
    t.index ["cohort_id"], name: "index_users_on_cohort_id", using: :btree
  end

end
