class HeadshotsController < ApplicationController
  def index
    @classes = DanceClass.where("name like '%eadshots%'")
    @days = @classes.map{ |c| c.start.to_date }.uniq
  end

  def show
    @class = DanceClass.find_by(id: params[:dance_class_id])
    @head_sched = HeadSched.find_or_create_by(dance_class_id: @class.id)
    unless @head_sched.body
      @head_sched.body = ""
      number_of_slots = @head_sched.dance_class.duration / 10
      number_of_slots.floor.times do |i|
        @head_sched.body += "#{(@head_sched.dance_class.start + (600 * i)).strftime('%I:%M')} - #{(@head_sched.dance_class.start + (600 * (i+1))).strftime('%I:%M')} - \n\n"
      end
    end
  end

  def update
    render '/404' if !( logged_in? && current_user.admin? )
    @head_sched = HeadSched.find_by(id: params['id'])
    @head_sched.update_attributes(body: params['body'])
    redirect_to "/dance_classes/#{@head_sched.dance_class_id}/headshots"
  end
end