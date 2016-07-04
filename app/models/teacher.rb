class Teacher < ActiveRecord::Base
  has_many :dance_classes

  def full_name
    self.first_name + " " + self.last_name
  end

  def hours
    ((self.dance_classes.inject(0){ |sum,x| sum + x.duration }) / 60).to_f
  end
end
