# Handles our puppies
class Puppy < ApplicationRecord
  include ImageUploader[:image]
  belongs_to :user

  # Favorited by users
  has_many :favorite_puppies # just the 'relationships'
  has_many :favorited_by, through: :favorite_puppies, source: :user #

  # very ugly sql search function
  def self.search(search)
    where('name ILIKE ? OR breed ILIKE ? OR age ILIKE ? OR size ILIKE ? OR gender ILIKE ? OR bio ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
