class Teacher < ActiveRecord::Base
  has_many :dance_classes

  def dance_classes
    DanceClass.where(teacher_id: self.id) + DanceClass.where(second_teacher_id: self.id)
  end

  def arriving_day
    self.arriving.to_date
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  def hours
    ((self.dance_classes.inject(0){ |sum,x| sum + x.duration }) / 60).to_f
  end
end
