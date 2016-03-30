class Flat < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  has_many :bookings
  belongs_to :user
end
