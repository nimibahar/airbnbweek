class PhotosController < ApplicationController

  def create
    flat = Flat.find(params[:photo][:flat_id])
    photo = Photo.new(photo_params)
    photo.flat = flat


    # @flat = Flat.find(params[:flat_id])
    # @photo = @flat.photos.build(photo_params)

    if photo.save
      redirect_to flat_path(flat)
    else
      redirect_to flat_path(flat)
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:flat_id, :cloudinary, :cloudinary_cache)
  end
end


