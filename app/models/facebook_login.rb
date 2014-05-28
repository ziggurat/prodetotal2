class FacebookLogin
  def initialize(fb_user_id, fb_user_token)
    @fb_user_id = fb_user_id
    @graph = Koala::Facebook::API.new(fb_user_token)
  end

  def fetch_or_create_user
    if is_valid_user?
      user = User.where(facebook_id: @fb_user_id).take
      if user.nil?
        Rails.logger.debug "User not found in the DB"
        user = User.create({facebook_id: @fb_user_id, name: @me['name']})
      end
      user
    else
      nil
    end
  end

  private

  def is_valid_user?
    begin
      @me = @graph.get_object('me')
      if @me['id'] == @fb_user_id        
        return true
      else
        Rails.logger.debug "Facebook user id does not match"
        return false
      end
    rescue Koala::Facebook::AuthenticationError => auth_error
      Rails.logger.debug "Authentication error with facebook"
      Rails.logger.debug auth_error
      return false
    end
  end
end