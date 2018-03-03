class CreateOpportunity < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.date :date_created
      t.integer :customer_id
      t.string :opportunity_name
      t.text :opportunity_description
      t.string :lead_source_code
      t.decimal :expected_revenue_amount
      t.decimal :current_expected_revenue_amount
      t.integer :employee_id
      t.string :opportunity_stage_code
      
      t.timestamps null: false
    end
  end
end
