class CreateCodeTables < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :state_name
      t.integer :sort_order
      t.timestamps null: false
    end
    
    create_table :countries do |t|
      t.string :country_name
      t.integer :sort_order
      t.timestamps null: false
    end
    
    create_table :lead_sources do |t|
      t.string :lead_source_name
      t.integer :sort_order
      t.timestamps null: false
    end
    
    create_table :grades do |t|
      t.string :grade_name
      t.integer :sort_order
      t.timestamps null: false
    end
    
    create_table :priorities do |t|
      t.string :priority_name
      t.integer :sort_order
      t.timestamps null: false
    end
    
    create_table :log_types do |t|
      t.string :log_type_name
      t.integer :sort_order
      t.timestamps null: false
    end
    
    create_table :communication_types do |t|
      t.string :communication_type_name
      t.integer :sort_order
      t.timestamps null: false
    end
    
    create_table :opportunity_stages do |t|
      t.string :opportunity_stage_name
      t.integer :sort_order
      t.timestamps null: false
    end
  end
end
