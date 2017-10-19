class Puppy < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user
=======
  include ImageUploader[:image]
  # belongs_to :user
>>>>>>> 48ea7b2... added css and homepage image, edited navbar, created home controller

  # Favorited by users
  has_many :favorite_puppies # just the 'relationships'
  has_many :favorited_by, through: :favorite_puppies, source: :user #
end
