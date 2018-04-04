class AddColumnToQuotatinoComment < ActiveRecord::Migration
  def change
    add_column :quotation_comments, :quotation_id, :integer
  end
end
