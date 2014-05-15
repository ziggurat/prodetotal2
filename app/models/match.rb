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
  	valid = Competition.exists?(self.competition_id)
    self.errors.add(:competition, "doesn't exist.") unless valid	
  end
  
  def local_team_exists
  	valid = Team.exists?(self.local_id)
    self.errors.add(:local, "doesn't exist.") unless valid	
  end
  
  def visitor_team_exists
  	valid = Team.exists?(self.visitor_id)
    self.errors.add(:visitor, "doesn't exist.") unless valid
  end
end
