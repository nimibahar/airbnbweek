class ProfilesController < ApplicationController
 before_action :set_profile, only: [:show, :edit, :update]

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @flats = Flat.where(user_id: current_user.id)
    @bookings = Booking.where(user_id: current_user.id)
  end

  # GET /profiles/1/edit
  def edit
  end


  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to dashboard_path, notice: 'profile was successfully updated.' }
        format.json { render :show, status: :ok, location: dashboard_path }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    # @profile = Profile.find(params[:id])
    @profile = current_user.profile
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit( :fname, :lname, :description, :city, :photo, :photo_cache )
  end

end
