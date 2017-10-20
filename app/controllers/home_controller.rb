class HomeController < ApplicationController
  def index
  end

  def favorite
  end

  def contact
  end
  
  def email

    email = params[:email]
    contact_name = params[:name]
    message = params[:message]
    ContactMailer.send_contact_email(email, contact_name, message).deliver_now
    redirect_to root_path
  end

end
