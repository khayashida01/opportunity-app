class DropTables < ActiveRecord::Migration
  def change
    drop_table :customers
    drop_table :opportunities
    drop_table :activities
  end
end
