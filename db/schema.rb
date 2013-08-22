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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130820055825) do

  create_table "clients", force: true do |t|
    t.string   "client_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lives", force: true do |t|
    t.string   "live_detail"
    t.integer  "qanote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lives", ["qanote_id"], name: "index_lives_on_qanote_id", using: :btree

  create_table "pages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "client_name"
  end

  add_index "projects", ["client_id"], name: "index_projects_on_client_id", using: :btree

  create_table "qanotes", force: true do |t|
    t.string   "clientdetail"
    t.string   "productname"
    t.string   "projectname"
    t.string   "currenttag"
    t.string   "oldtag"
    t.string   "servername"
    t.date     "date"
    t.string   "developername"
    t.string   "gatekeeper"
    t.string   "uploadedfromtag"
    t.string   "tasknodetail"
    t.string   "patchnamedetail"
    t.string   "diff1"
    t.string   "diff2"
    t.string   "signature"
    t.string   "testedby"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "task_id"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "stages", force: true do |t|
    t.string   "stage_detail"
    t.integer  "qanote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stages", ["qanote_id"], name: "index_stages_on_qanote_id", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "task_name"
    t.string   "task_description"
    t.string   "task_assigned_to"
    t.integer  "client_id"
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["client_id"], name: "index_tasks_on_client_id", using: :btree
  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "tests", force: true do |t|
    t.string   "test_detail"
    t.integer  "qanote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tests", ["qanote_id"], name: "index_tests_on_qanote_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
  end

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
