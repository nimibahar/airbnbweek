class AddFlatToBooking < ActiveRecord::Migration
  def change
    add_reference :bookings, :flat, index: true, foreign_key: true
  end
end
