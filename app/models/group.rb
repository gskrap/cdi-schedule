class Group < ActiveRecord::Base
  has_many :students

  def dance_classes
    DanceClass.where("for_group_#{self.name[-1].downcase} = true")
  end
end
