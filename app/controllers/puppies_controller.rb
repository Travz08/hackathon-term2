# This takes care of our puppies project
class PuppiesController < ApplicationController
  before_action :authenticate_user!, only: [:enquire]
  before_action :set_puppy, only: %i[show edit update destroy]

  # GET /puppies
  # GET /puppies.json
  def index
    @puppies = Puppy.all

    # adding conditions to find puppies if given search params
    @puppies = if params[:search]
                 Puppy.search(params[:search]).order('created_at DESC')
               else
                 Puppy.all.order('created_at DESC')
               end
  end

  # GET /puppies/1
  # GET /puppies/1.json
  def show; end

  # GET /puppies/new
  def new
    @puppy = Puppy.new
  end

  # GET /puppies/1/edit
  def edit; end

  # POST /puppies
  # POST /puppies.json
  def create
    @puppy = Puppy.new(puppy_params)

    respond_to do |format|
      if @puppy.save
        format.html { redirect_to @puppy, notice: 'Puppy was successfully created.' }
        format.json { render :show, status: :created, location: @puppy }
      else
        format.html { render :new }
        format.json { render json: @puppy.errors, status: :unprocessable_entity }
      end
    end
  end

  # Add and remove favorite puppies
  # for current_user
  def favorite
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

  def enquire; end

  def email
    email = current_user.email
    contact_name = params[:name]
    message = params[:message]
    ContactMailer.send_contact_email(email, contact_name, message).deliver_now
    redirect_to root_path
  end

  # PATCH/PUT /puppies/1
  # PATCH/PUT /puppies/1.json
  def update
    respond_to do |format|
      if @puppy.update(puppy_params)
        format.html { redirect_to @puppy, notice: 'Puppy was successfully updated.' }
        format.json { render :show, status: :ok, location: @puppy }
      else
        format.html { render :edit }
        format.json { render json: @puppy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puppies/1
  # DELETE /puppies/1.json
  def destroy
    @puppy.destroy
    respond_to do |format|
      format.html { redirect_to puppies_url, notice: 'Puppy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_puppy
    @puppy = Puppy.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def puppy_params
    params.require(:puppy).permit(:image, :name, :age, :breed, :size, :gender, :bio, :desexed, :vaccinated, :adoption_fee)
  end
end
