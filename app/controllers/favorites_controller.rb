# This handles our favourite controls
class FavoritesController < ApplicationController
  def favorite
    # Add and remove favorite puppies
    # for current_user
    type = params[:type]
    if type == 'favorite'
      current_user.favorites << @puppy
      redirect_to :back, notice: "You favorited #{@puppy.name}"

    elsif type == 'unfavorite'
      current_user.favorites.delete(@puppy)
      redirect_to :back, notice: "Unfavorited #{@puppy.name}"

    else
      # Type missing, nothing happens
      redirect_to :back, notice: 'Nothing happened.'
    end
  end
end
