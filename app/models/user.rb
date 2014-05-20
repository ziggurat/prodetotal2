class User < ActiveRecord::Base
  def self.from_facebook_id(facebook_id)
    User.where(facebook_id: facebook_id).take
  end
end
