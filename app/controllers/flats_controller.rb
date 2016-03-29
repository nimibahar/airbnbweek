class FlatsController < ApplicationController
  before_action :flat, only: [:show, :edit, :destroy, :update]

  def index
    # byebu//g
    @flats = Flat.where(city: params[:city])
    @city = params[:city]

  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
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
    params.require(:flat).permit(:address, :city, :price, :rooms)
  end
end
