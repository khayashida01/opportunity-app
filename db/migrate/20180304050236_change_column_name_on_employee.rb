class ChangeColumnNameOnEmployee < ActiveRecord::Migration
  def change
    remove_column :employees, :emergency_relation_code
    add_column :employees, :emergency_relation_code, :integer
  end
end
