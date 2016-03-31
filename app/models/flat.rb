class Flat < ActiveRecord::Base
  has_many :photos, dependent: :destroy
  has_many :bookings
  belongs_to :user
  # full_address method was added because our address doesn't have the city
  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?

  def full_address
    address + ' ' + city
  end
end
