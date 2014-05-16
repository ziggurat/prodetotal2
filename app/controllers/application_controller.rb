class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session


  def valid_user_token?
    user_token = request.headers["User-Token"]
    return false if user_token.nil?
    # check if user_token exists in the user DB
    @user = User.from_token(user_token)
    if @user.nil?
      false
    else      
      true
    end
  end

  def request_user
    @user
  end

  def serve_ember_app
  	render 'layouts/serve_ember_app'
  end
end
