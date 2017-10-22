class Location < ApplicationRecord
  belongs_to :user

  geocoded_by :full_address
  after_validation :geocode


  def full_address
    "7 kelly street, 2007, Australia"
  end
end
