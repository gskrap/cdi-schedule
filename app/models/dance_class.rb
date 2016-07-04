class DanceClass < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :group
  belongs_to :location

  validates :group_id, presence: true

  def duration
    (self.end - self.start) / 60
  end

  def class_day
    self.start.to_date
  end
end
