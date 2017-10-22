# Made by Devise to handle our login
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :puppies
  has_one :location

  # Favorite puppies of user
  has_many :favorite_puppies # just the 'relationships'
  has_many :favorites, through: :favorite_puppies, source: :puppy # the actual puppies a user favorites

  def add_favorite(puppy)
    if self.favorites.where(id: puppy.id).empty?
      FavoritePuppy.create(user: self, puppy: puppy)
    end
  end
end
