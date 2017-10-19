class Puppy < ApplicationRecord
  include ImageUploader[:image]
  # belongs_to :user

  # Favorited by users
  has_many :favorite_puppies # just the 'relationships'
  has_many :favorited_by, through: :favorite_puppies, source: :user #
end
