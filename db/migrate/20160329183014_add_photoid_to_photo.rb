class AddPhotoidToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :cloudinary, :string
  end
end
