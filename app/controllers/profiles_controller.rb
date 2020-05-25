class ProfilesController < ApplicationController
  
  before_action :find_profile, only: [:show, :update]
  # before_action :authenticate_user!, except: [:index, :show]
  
  # probably don't need index
  def index
    profiles = Profile.all
    render json: profiles
  end
  
  def show
    render json: profile
  end
  
  def update
    # byebug
    if @profile.update(profile_params)
      render json: profile
   else  
      render json: @profile.errors, status: :error
  end
  
  private
  
  def find_profile
    @profile = Profile.find(params[:id])
  end
  
  def profile_params
    params.permit(:profile).permit(:user_id, :cover_photo_url, :profile_picture_url, :user_id)
  end


end
