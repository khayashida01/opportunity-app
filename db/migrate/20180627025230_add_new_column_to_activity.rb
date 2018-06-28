class AddNewColumnToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :schedule_datetime, :datetime
  end
end
