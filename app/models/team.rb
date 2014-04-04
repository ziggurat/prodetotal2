## Class Team
class Team < ActiveRecord::Base
  validates :key, :name, presence: true
  validates :key, :name, uniqueness: true
end
