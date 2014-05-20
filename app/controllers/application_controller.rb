class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  #before_action :ensure_facebook_id_is_sent
  #before_action :ensure_user_exists

  def serve_ember_app
  	render 'layouts/serve_ember_app'
  end

  protected

  def ensure_facebook_id_is_sent
    fb_id = request.headers['User-Facebook-Id']
    if fb_id.nil?
      render json: {'User-Facebook-Id' => "User-Facebook-Id header not present"}, status: :unauthorized
    end
  end

  def current_user
    facebook_id = request.headers['User-Facebook-Id']
    user = User.from_facebook_id(facebook_id)
  end

  def ensure_user_exists
    if current_user.nil?
      render json: {error: 'No user provided'}, status: :unauthorized
    end
  end
end
