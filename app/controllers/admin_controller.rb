class AdminController < ApplicationController
  def show
    render '/404' if !( logged_in? && current_user.admin? )
  end

  def help
  end
end
