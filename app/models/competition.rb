class Competition < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  def self.upcoming
    where(archive: false).where("start_date > :today", {today: (Time.now)}).order(:start_date)
  end

  def self.in_progress
    where(archive: false).where("start_date < :today", {today: Time.now})
    .where("end_date > :today", {today: Time.now}).order(:start_date)
  end

  def self.archived
    where(archive: true).order(:start_date)
  end

  def self.near
    in_progress + upcoming
  end
end
