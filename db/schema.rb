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

ActiveRecord::Schema.define(version: 20130715041014) do

  create_table "attendances", force: true do |t|
    t.string   "on_time"
    t.integer  "employee_detail_id"
    t.integer  "schedule_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: true do |t|
    t.string  "document_name"
    t.string  "document_path"
    t.boolean "status",        default: true
  end

  create_table "employee_details", force: true do |t|
    t.string   "title"
    t.string   "emp_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "pan_number"
    t.string   "pf_number"
    t.string   "gender"
    t.string   "martial_status"
    t.date     "dob"
    t.date     "date_of_join"
    t.integer  "role_id"
    t.string   "contact_no"
    t.string   "official_mailid"
    t.string   "password"
    t.string   "manager_mailid"
    t.string   "empl_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tl_mailid",           limit: nil
    t.string   "reset_password_code", limit: nil
    t.string   "active_resetcode",    limit: nil, default: "False",  null: false
    t.boolean  "lock"
    t.string   "active",                          default: "Active"
  end

  create_table "leave_details", force: true do |t|
    t.integer "employee_detail_id"
    t.integer "leave_type_id"
    t.float   "total_leaves"
    t.float   "balance"
    t.float   "availed"
    t.float   "carry_forward"
    t.integer "year"
    t.float   "total_leave_balance"
  end

  create_table "leave_records", force: true do |t|
    t.integer "leave_type_id"
    t.integer "employee_detail_id"
    t.integer "year"
    t.date    "from_date"
    t.date    "to_date"
    t.string  "reason"
    t.string  "status",             default: "Pending", null: false
    t.float   "no_of_days"
  end

  create_table "leave_types", force: true do |t|
    t.string "leave_types"
    t.float  "total_leaves"
  end

  create_table "newtable", id: false, force: true do |t|
    t.text    "name"
    t.decimal "salary"
  end

  create_table "personal_details", force: true do |t|
    t.integer  "employee_detail_id"
    t.integer  "pg_year"
    t.integer  "ug_year"
    t.integer  "diploma_year"
    t.integer  "puc_year"
    t.integer  "tenth_year"
    t.date     "anniversary_date"
    t.date     "p_dob"
    t.string   "local_address"
    t.string   "permanent_address"
    t.string   "changeof_address"
    t.string   "personalmail_id"
    t.string   "emergency_contact"
    t.string   "blood_group"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "company_name"
    t.string   "designation"
    t.string   "experience"
    t.string   "pg"
    t.string   "ug"
    t.string   "diploma"
    t.string   "puc"
    t.string   "tenth"
    t.string   "guardian"
    t.string   "relationship"
    t.string   "company_name2"
    t.string   "designation2"
    t.string   "experience2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string "role_name"
  end

  create_table "schedules", force: true do |t|
    t.date     "schedule_date"
    t.integer  "employee_detail_id"
    t.integer  "discussion"
    t.string   "topic"
    t.string   "category"
    t.text     "assignment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "techup_feedbacks", force: true do |t|
    t.string   "trainers_knowledge_on_the_topic"
    t.string   "attitude_and_delivery_method"
    t.string   "communication_skills"
    t.string   "training_feedback"
    t.string   "query_handling_ability"
    t.string   "content_of_the_training"
    t.string   "session_preparation"
    t.integer  "employee_detail_id"
    t.integer  "schedule_id"
    t.integer  "attendance_id"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
