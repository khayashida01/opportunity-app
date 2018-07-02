class AddStatusToActivity < ActiveRecord::Migration
  def change
    remove_column :activities, :activity_status, :string
    add_column :activities, :activity_status_id, :integer
  end
end
