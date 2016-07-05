class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
  end

  def edit
    render '/404' if !( logged_in? && current_user.admin? )
    @group = Group.find(params[:id])
  end

  def schedule
    @group = Group.find_by(id: params['group_id'])
    @classes = @group.dance_classes.order('start')
    @days = @classes.map{ |c| c.start.to_date }.uniq
  end
end
