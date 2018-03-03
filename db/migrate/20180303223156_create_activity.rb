class CreateActivity < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :opportunity_id
      t.string :activity_status
      t.integer :probability
      t.date :date_created
      t.string :opportunity_stage_code
      t.string :log_type
      t.date :due_date
      t.integer :employee_id
      t.string :priority_code
      t.text :description
      t.text :comment
      
      t.timestamps null: false
    end
  end
end
