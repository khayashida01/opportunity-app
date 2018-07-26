class CreateStaff < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.integer :customer_id
      t.string :first_name
      t.string :last_name
      t.string :title
      t.string :department
      t.string :email
      t.string :tel

      t.timestamps null: false
    end
  end
end
