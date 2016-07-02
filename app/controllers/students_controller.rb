class StudentsController < ApplicationController
  def post
    Student.find_or_create_by(name: params['name'], group_id: params['group_id'])
    redirect_to "/groups/#{params['group_id']}"
  end
end
