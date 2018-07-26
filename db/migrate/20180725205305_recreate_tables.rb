class RecreateTables < ActiveRecord::Migration
  def change

    create_table "customers", force: :cascade do |t|
      t.string   "company_name"
      t.string   "url"
      t.string   "industory"
      t.text     "business_description"
      t.string   "bill_to_street"
      t.string   "bill_to_city"
      t.integer   "bill_to_state_id"
      t.string   "bill_to_zip_code"
      t.integer   "bill_to_country_id"
      t.string   "ship_to_first_name"
      t.string   "ship_to_last_name"
      t.string   "ship_to_tel"
      t.string   "ship_to_email"
      t.string   "ship_to_street"
      t.string   "ship_to_city"
      t.integer   "ship_to_state_id"
      t.string   "ship_to_zip_code"
      t.integer   "ship_to_country_id"
      t.datetime "created_at",           null: false
      t.datetime "updated_at",           null: false
      t.float    "latitude"
      t.float    "longitude"
    end

    create_table "opportunities", force: :cascade do |t|
      t.integer  "customer_id"
      t.date     "date_created"
      t.string   "opportunity_name"
      t.text     "opportunity_description"
      t.integer   "lead_source_id"
      t.decimal  "expected_revenue_amount"
      t.decimal  "current_expected_revenue_amount"
      t.decimal  "actual_sales_amount"
      t.integer  "user_id"
      t.integer   "opportunity_stage_id"
      t.datetime "created_at",                      null: false
      t.datetime "updated_at",                      null: false
      t.integer   "grade_id"
    end

    create_table "activities", force: :cascade do |t|
      t.integer  "opportunity_id"
      t.date     "date_created"
      t.integer  "activity_status_id"
      t.integer  "probability"
      t.integer   "priority_id"
      t.integer   "opportunity_stage_id"
      t.integer   "log_type_id"
      t.integer   "communication_type_id"
      t.integer  "user_id"
      t.date     "due_date"
      t.text     "activity_name"
      t.text     "description"
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
      t.datetime "schedule_start_at"
      t.datetime "schedule_end_at"
      t.string   "schedule_place_name"
      t.string   "schedule_street"
      t.string   "schedule_city"
      t.integer   "schedule_state_id"
      t.string   "schedule_zip_code"
      t.integer   "schedule_country_id"
      t.float    "schedule_latitude"
      t.float    "schedule_longitude"
    end

  end
end
