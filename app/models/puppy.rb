# Handles our puppies
class Puppy < ApplicationRecord
  include ImageUploader[:image]
  # belongs_to :user

  # Favorited by users
  has_many :favorite_puppies # just the 'relationships'
  has_many :favorited_by, through: :favorite_puppies, source: :user #

  def self.search(search)
    where('name LIKE ? OR breed LIKE ? OR age LIKE ? OR size LIKE ? OR gender LIKE ? OR bio LIKE ? OR desexed LIKE ? OR vaccinated LIKE ? OR adoption_fee LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
