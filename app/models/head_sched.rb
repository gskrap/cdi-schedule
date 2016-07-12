class HeadSched < ActiveRecord::Base
  belongs_to :dance_class
  validates :dance_class_id, presence: true
end