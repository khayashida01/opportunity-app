class ModCustomer < ActiveRecord::Migration
  def change
    rename_column :customers, :industory, :industry
  end
end
