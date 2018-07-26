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

ActiveRecord::Schema.define(version: 20180726151505) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "activities", force: :cascade do |t|
    t.integer  "opportunity_id"
    t.date     "date_created"
    t.integer  "activity_status_id"
    t.integer  "probability"
    t.integer  "priority_id"
    t.integer  "opportunity_stage_id"
    t.integer  "log_type_id"
    t.integer  "communication_type_id"
    t.integer  "user_id"
    t.date     "due_date"
    t.text     "activity_name"
    t.text     "description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.datetime "schedule_start_at"
    t.datetime "schedule_end_at"
    t.string   "schedule_place_name"
    t.string   "schedule_street"
    t.string   "schedule_city"
    t.integer  "schedule_state_id"
    t.string   "schedule_zip_code"
    t.integer  "schedule_country_id"
    t.float    "schedule_latitude"
    t.float    "schedule_longitude"
    t.datetime "actual_start_at"
    t.datetime "actual_end_at"
    t.string   "attendees"
    t.integer  "activity_feeling_id"
    t.text     "comment"
  end

  create_table "activity_feelings", force: :cascade do |t|
    t.string   "activity_feeling_name"
    t.integer  "sort_order"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "activity_statuses", force: :cascade do |t|
    t.string   "activity_status_name"
    t.integer  "sort_order"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "communication_types", force: :cascade do |t|
    t.string   "communication_type_name"
    t.integer  "sort_order"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "country_name"
    t.integer  "sort_order"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "company_name"
    t.string   "url"
    t.string   "industry"
    t.text     "business_description"
    t.string   "bill_to_street"
    t.string   "bill_to_city"
    t.integer  "bill_to_state_id"
    t.string   "bill_to_zip_code"
    t.integer  "bill_to_country_id"
    t.string   "ship_to_first_name"
    t.string   "ship_to_last_name"
    t.string   "ship_to_tel"
    t.string   "ship_to_email"
    t.string   "ship_to_street"
    t.string   "ship_to_city"
    t.integer  "ship_to_state_id"
    t.string   "ship_to_zip_code"
    t.integer  "ship_to_country_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "email"
    t.string   "flsa_status"
    t.date     "date_of_birth"
    t.string   "work_location"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.string   "home_tel"
    t.string   "cell_tel"
    t.string   "private_email"
    t.string   "emergency_contact_name"
    t.string   "emergency_contact_tel"
    t.string   "emergency_contact_email"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "emergency_relation_id"
  end

  create_table "geousers", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string   "grade_name"
    t.integer  "sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lead_sources", force: :cascade do |t|
    t.string   "lead_source_name"
    t.integer  "sort_order"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "log_types", force: :cascade do |t|
    t.string   "log_type_name"
    t.integer  "sort_order"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "opportunities", force: :cascade do |t|
    t.integer  "customer_id"
    t.date     "date_created"
    t.string   "opportunity_name"
    t.text     "opportunity_description"
    t.integer  "lead_source_id"
    t.decimal  "expected_revenue_amount"
    t.decimal  "current_expected_revenue_amount"
    t.decimal  "actual_sales_amount"
    t.integer  "user_id"
    t.integer  "opportunity_stage_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "grade_id"
  end

  create_table "opportunity_stages", force: :cascade do |t|
    t.string   "opportunity_stage_name"
    t.integer  "sort_order"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "priorities", force: :cascade do |t|
    t.string   "priority_name"
    t.integer  "sort_order"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "quotation_comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "quotation_id"
  end

  create_table "quotations", force: :cascade do |t|
    t.date     "date_created"
    t.string   "sales"
    t.integer  "customer_id"
    t.text     "description"
    t.integer  "revision"
    t.string   "fob_cif_code"
    t.string   "port"
    t.string   "quantity_allowance_code"
    t.string   "frequency_of_shipment"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "quotation_status_id"
    t.integer  "quantity_allowance"
  end

  create_table "relations", force: :cascade do |t|
    t.string   "relation_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "department"
    t.string   "email"
    t.string   "tel"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "state_name"
    t.integer  "sort_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todo_priorities", force: :cascade do |t|
    t.string   "todo_priority_name"
    t.integer  "sort_order"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "todo_statuses", force: :cascade do |t|
    t.string   "todo_status_name"
    t.integer  "sort_order"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "todos", force: :cascade do |t|
    t.integer  "opportunity_id"
    t.integer  "activity_id"
    t.integer  "user_id"
    t.date     "date_created"
    t.integer  "todo_status_id"
    t.string   "todo_name"
    t.text     "description"
    t.date     "due_date"
    t.integer  "todo_priority_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "group_id"
    t.float    "current_latitude"
    t.float    "current_longitude"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
