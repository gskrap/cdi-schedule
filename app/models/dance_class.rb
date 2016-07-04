class DanceClass < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :group
  belongs_to :location

  def duration
    (self.end - self.start) / 60
  end
end
