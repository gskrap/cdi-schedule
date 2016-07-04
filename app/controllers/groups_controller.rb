class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def schedule
    @group = Group.find_by(id: params['group_id'])
    @classes = @group.dance_classes.order('start')
    @days = @classes.map{ |c| c.start.to_date }.uniq
  end
end
