class Match < ActiveRecord::Base
  belongs_to :competition
  belongs_to :local, class: 'Team'
  belongs_to :visitor, class: 'Team'
  validate :competition_exists
  validate :local_team_exists
  validate :visitor_team_exists

  def set_score(local_score, visitor_score)
    self.local_score = local_score
    self.visitor_score = visitor_score
    self.save!
  end

  private

  def competition_exists
    valid = Competition.exists?(competition_id)
    errors.add(:competition, "doesn't exist.") unless valid
  end

  def local_team_exists
    valid = Team.exists?(local_id)
    errors.add(:local, "doesn't exist.") unless valid
  end

  def visitor_team_exists
    valid = Team.exists?(visitor_id)
    errors.add(:visitor, "doesn't exist.") unless valid
  end
end
