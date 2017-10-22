# Rubo cop needs a comment here
class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:contact]
  def index; end

  def favorite; end

  def contact
    @location = Location.new(id: 1, address: "7 kelly street", city: "sydney", postcode: "2007", country: "Australia", latitude: -33.881959, longitude: 151.195238, user_id: 1)
  end

  def email
    email = current_user.email
    contact_name = params[:name]
    message = params[:message]
    ContactMailer.send_contact_email(email, contact_name, message).deliver_now
    redirect_to root_path
  end
end
