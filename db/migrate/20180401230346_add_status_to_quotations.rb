class AddStatusToQuotations < ActiveRecord::Migration
  def change
    add_column :quotations, :quotation_status_id, :integer
  end
end
