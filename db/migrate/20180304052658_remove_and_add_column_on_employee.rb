class RemoveAndAddColumnOnEmployee < ActiveRecord::Migration
  def change
    remove_column :employees, :emergency_relation_code
    add_column :employees, :emergency_relation_id, :integer
  end
end
