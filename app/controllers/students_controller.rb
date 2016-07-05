class StudentsController < ApplicationController
  def post
    render '/404' if !( logged_in? && current_user.admin? )
    full_name = params['name'].split(' ', 2)
    Student.find_or_create_by(first_name: full_name[0], last_name: full_name[1], group_id: params['group_id'])
    redirect_to "/groups/#{params['group_id']}"
  end

  def delete
    render '/404' if !( logged_in? && current_user.admin? )
    Student.find(params[:id]).destroy
    redirect_to "/groups/#{params['group_id']}/edit"
  end
end
