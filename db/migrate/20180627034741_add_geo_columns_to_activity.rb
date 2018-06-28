class AddGeoColumnsToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :schedule_place_name, :string
    add_column :activities, :schedule_latitude, :float
    add_column :activities, :schedule_longitude, :float
  end
end
