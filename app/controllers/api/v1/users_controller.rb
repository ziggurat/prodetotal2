module Api
  module V1
    class UsersController < ApplicationController
      before_action :can_access?
      def show        
        render json: current_user
      end
    end
  end
end
