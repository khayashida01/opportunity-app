class CreateActivityStatus < ActiveRecord::Migration
  def change
    create_table :activity_statuses do |t|
      t.string :activity_status_name
      t.integer :sort_order

      t.timestamps null: false
    end
  end
end
