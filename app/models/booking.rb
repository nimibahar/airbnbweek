class Booking < ActiveRecord::Base
  belongs_to :flats
  belongs_to :users
end
