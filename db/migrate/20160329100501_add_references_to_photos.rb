class AddReferencesToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :flat, index: true
    add_foreign_key :photos, :flats
  end
end
