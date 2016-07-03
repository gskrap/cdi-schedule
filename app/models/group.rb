class Group < ActiveRecord::Base
  has_many :students
  has_many :dance_classes
end
