class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile

  def show
    render json: @profile
  end

  def update

  end

  private

  def profile_params

  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

end
