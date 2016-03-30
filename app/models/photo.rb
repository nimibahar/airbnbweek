class Photo < ActiveRecord::Base
  belongs_to :flat
  mount_uploader :cloudinary, PhotoUploader
end
