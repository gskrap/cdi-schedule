class StudentsController < ApplicationController
  def post
    Student.find_or_create_by(name: params['name'], group_id: params['group_id'])
    redirect_to "/groups/#{params['group_id']}"
  end

  def delete
    Student.find(params[:id]).destroy
    redirect_to "/groups/#{params['group_id']}/edit"
  end
end
