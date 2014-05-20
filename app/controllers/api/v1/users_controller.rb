module Api
  module V1
    class UsersController < ApplicationController
      def login
        user = User.where(facebook_id: login_params[:facebook_id]).take
        if user.nil?
          user = User.create(facebook_id: login_params[:facebook_id])
        end
        render json: user
      end

      private

      def login_params
        params.permit(:facebook_id)
      end
    end
  end
end
