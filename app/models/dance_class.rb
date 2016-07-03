class DanceClass < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :group
  belongs_to :location
end
