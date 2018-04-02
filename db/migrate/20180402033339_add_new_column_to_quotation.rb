class AddNewColumnToQuotation < ActiveRecord::Migration
  def change
    add_column :quotations, :quantity_allowance, :integer
  end
end
