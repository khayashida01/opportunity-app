class CreateEmployee < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :email
      t.string :flsa_status
      t.date :date_of_birth
      t.string :work_location
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :home_tel
      t.string :cell_tel
      t.string :private_email
      t.string :emergency_contact_name
      t.string :emergency_relation_code
      t.string :emergency_contact_tel
      t.string :emergency_contact_email

      t.timestamps null: false
    end
  end
end
