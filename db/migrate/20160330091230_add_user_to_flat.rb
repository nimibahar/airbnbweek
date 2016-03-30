class AddUserToFlat < ActiveRecord::Migration
  def change
    add_reference :flats, :user, index: true
    add_foreign_key :flats, :users
  end
end
