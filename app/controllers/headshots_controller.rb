class HeadshotsController < ApplicationController
  def index
    @classes = DanceClass.where("name like '%eadshots%'")
    @days = @classes.map{ |c| c.start.to_date }.uniq
  end
end