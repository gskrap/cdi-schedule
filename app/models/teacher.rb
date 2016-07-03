class Teacher < ActiveRecord::Base
  has_many :dance_classes

  def full_name
    self.first_name + " " + self.last_name
  end
end
