class PhotosController < ApplicationController
  def create
    @flat = Flat.find(params[:flat_id])
    @photo = @flat.photos.build(review_params)

    if @photo.save
      redirect_to flat_path(@flat)
    else
      redirect_to flat_path(@flat)
    end
  end

  private

  def review_params
    params.require(:photo).permit(:file_key)
  end
end


