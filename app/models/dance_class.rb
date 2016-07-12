class DanceClass < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :second_teacher, :class_name => 'Teacher', :foreign_key => 'second_teacher_id'
  belongs_to :location

  has_one :head_sched

  validates :teacher_id, presence: true
  validates :name, presence: true

  def duration
    (self.end - self.start) / 60
  end

  def class_day
    self.start.to_date
  end
end
