class AddColumnsToActivityAndCreateTodo < ActiveRecord::Migration
  def change
    add_column :activities, :actual_start_at, :datetime
    add_column :activities, :actual_end_at, :datetime
    add_column :activities, :attendees, :string
    add_column :activities, :activity_feeling_id, :integer
    add_column :activities, :comment, :text
    
    create_table :activity_feelings do |t|
      t.string :activity_feeling_name
      t.integer :sort_order
      t.timestamps null: false
    end
    
    create_table :todos do |t|
      t.integer :opportunity_id
      t.integer :activity_id
      t.integer :user_id
      t.date :date_created
      t.integer :todo_status_id
      t.string :todo_name
      t.text :description
      t.date :due_date
      t.integer :todo_priority_id
      t.timestamps null: false
    end
    
    create_table :todo_statuses do |t|
      t.string :todo_status_name
      t.integer :sort_order
      t.timestamps null: false
    end
    
    create_table :todo_priorities do |t|
      t.string :todo_priority_name
      t.integer :sort_order
      t.timestamps null: false
    end
  end
  
end
