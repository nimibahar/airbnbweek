class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.text :description
      t.string :city

      t.timestamps null: false
    end
  end
end
