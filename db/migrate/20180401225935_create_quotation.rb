class CreateQuotation < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.date :date_created
      t.string :sales
      t.integer :customer_id
      t.text :description
      t.integer :revision
      t.string :fob_cif_code
      t.string :port
      t.string :quantity_allowance_code
      t.string :frequency_of_shipment
      
      t.timestamps null: false
    end
  end
end
