class Flat < ActiveRecord::Base
  has_many :photos, dependent: :destroy
end
