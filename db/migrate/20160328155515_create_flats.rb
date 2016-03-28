class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :address
      t.string :city
      t.integer :price
      t.integer :rooms

      t.timestamps null: false
    end
  end
end
