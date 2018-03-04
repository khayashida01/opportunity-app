class CreateRelation < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string :relation_name
      
      t.timestamps null: false
    end
  end
end
