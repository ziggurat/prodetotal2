class Challenge < ActiveRecord::Base
  belongs_to :owner, :class_name => 'User'
  belongs_to :competition
  has_many :users, through: :user_challenges

  validates :name, presence: true
  validate :owner_exists
  validate :competition_exists

  private
  def owner_exists
    valid = User.exists?(owner_id)
    errors.add(:owner, "doesn't exist.") unless valid
  end

  def competition_exists
    valid = Competition.exists?(competition_id)
    errors.add(:competition, "doesn't exist.") unless valid
  end
end
