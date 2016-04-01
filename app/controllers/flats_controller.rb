class FlatsController < ApplicationController
  before_action :flat, only: [:show, :edit, :destroy, :update]

  def index
    @flats = Flat.where(city: params[:city])
    @city = params[:city]

        # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end

  end

  def show
# I'm using [@flat] because I need only this specific flat but I could use an array of flats also.
    @markers = Gmaps4rails.build_markers([@flat]) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      p = @flat.photos.first
      p.cloudinary = params[:flat][:photo][:cloudinary]
      p.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @flat.update_attributes(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    flat.destroy
    redirect_to root_path
  end


  private

  def flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:address, :city, :price, :rooms, :user_id,
     photos_attributes: [:id, :file_key , :cloudinary, :cloudinary_cache, :description] )
  end
end
