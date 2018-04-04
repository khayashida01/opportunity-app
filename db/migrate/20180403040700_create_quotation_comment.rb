class CreateQuotationComment < ActiveRecord::Migration
  def change
    create_table :quotation_comments do |t|
      t.text :comment
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end