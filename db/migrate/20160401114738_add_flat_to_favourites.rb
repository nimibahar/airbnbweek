class AddFlatToFavourites < ActiveRecord::Migration
  def change
    add_reference :favourites, :flat, index: true, foreign_key: true
  end
end
