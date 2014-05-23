module Api
  module V1
    class UsersController < ApplicationController
      before_action :can_access?
      def show        
        @user = current_user
      end
    end
  end
end
