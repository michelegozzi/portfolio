# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140326220651) do

  create_table "contact_profiles", :force => true do |t|
    t.string   "name"
    t.string   "icon_class"
    t.integer  "profile_type"
    t.string   "value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "icon_name"
    t.integer  "priority"
  end

  create_table "dispatches", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "personal_informations", :force => true do |t|
    t.string   "about"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.integer  "sector_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "uuid"
  end

  add_index "projects", ["name", "sector_id"], :name => "index_projects_on_name_and_sector_id", :unique => true
  add_index "projects", ["sector_id"], :name => "index_projects_on_sector_id"

  create_table "resources", :force => true do |t|
    t.string   "display_name"
    t.string   "file_path"
    t.string   "mime_type"
    t.integer  "project_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "encoded_file"
  end

  add_index "resources", ["project_id"], :name => "index_resources_on_project_id"

  create_table "sectors", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "icon_name"
    t.string   "icon_class"
  end

  add_index "sectors", ["description"], :name => "index_sectors_on_description"

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.integer  "skillset_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "skills", ["name"], :name => "index_skills_on_name"

  create_table "skillsets", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "skillsets", ["name"], :name => "index_skillsets_on_name"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "remember_token"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
