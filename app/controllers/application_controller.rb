class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :ensure_user_is_valid, except: [:serve_ember_app]

  def serve_ember_app
    render 'layouts/serve_ember_app'
  end

  private

  def ensure_user_is_valid
    fb_id = request.headers['Facebook-User-Id']
    fb_token = request.headers['Facebook-User-Token']
    fc = FacebookLogin.new(fb_id, fb_token)
    @user = fc.fetch_or_create_user
    if @user.nil?
      render json: {error: 'User authentication failed'}, status: :unauthorized
    end
  end

  def current_user
    @user
  end

  def can_access?
    if params[:user_id] != @user.facebook_id
      render json: {error: "You can't access this resource"}, status: :unauthorized
    end
  end
end
