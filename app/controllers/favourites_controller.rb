class FavouritesController < ApplicationController
  def create
    favourite = Favourite.new
    favourite.user = current_user
    favourite.flat_id = params[:flat].to_i
    favourite.save
    redirect_to :back
  end

  def index
    @favourites = Favourite.all
  end

  def destroy
    f = Favourite.find(params[:id])
    f.destroy
    redirect_to :back
  end
end
