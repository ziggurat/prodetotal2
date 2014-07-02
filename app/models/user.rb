class User < ActiveRecord::Base
  attr_accessor :token
  has_many :challenges, through: :user_challenges
end
