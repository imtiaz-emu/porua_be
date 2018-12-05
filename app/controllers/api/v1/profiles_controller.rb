module Api
  module V1
    class ProfilesController < ApplicationController
      before_action :set_profile, :except => [:valid_username]

      def show
        render json: @profile
      end

      def update
        if authorized?(@profile)
          if @profile.update(profile_params)
            render json: @profile
          else
            render json: @profile.errors, status: :unprocessable_entity
          end
        end
      end

=begin
      def valid_username
        if User.find_by_username(params[:name])
          render json: {
              status: 'Username already taken!'
          }.to_json
        else
          render json: {
              status: 'Valid Username!'
          }.to_json
        end
      end
=end

      def update_username
        if authorized?(@profile)
          @profile.user.update_attribute(:name, params[:name])
          render json: {success: 'Username updated!'}, status: 200
        end
      end

      private

      def profile_params
        params.require(:profile).permit(:first_name, :last_name, :phone, :address,
                                        :short_bio, :fb_username, :photo, :gender,
                                        :date_of_birth)
      end

      def set_profile
        @profile = Profile.find(params[:id])
      end

    end
  end
end
