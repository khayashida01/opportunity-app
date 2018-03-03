class CreateCustomer < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :company_name
      t.string :url
      t.string :industory_code
      t.text :business_description
      
      t.string :contact_first_name
      t.string :contact_last_name
      t.string :contact_title
      t.string :contact_department
      t.string :contact_tel
      t.string :contact_email
      
      t.string :bill_to_street
      t.string :bill_to_city
      t.string :bill_to_state
      t.string :bill_to_zip_code
      t.string :bill_to_country
      
      t.string :ship_to_first_name
      t.string :ship_to_last_name
      t.string :ship_to_tel
      t.string :ship_to_email
      t.string :ship_to_street
      t.string :ship_to_city
      t.string :ship_to_state
      t.string :ship_to_zip_code
      t.string :ship_to_country
      
      t.timestamps null: false
    end
  end
end
