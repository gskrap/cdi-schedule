class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    render '/404' if !( logged_in? && current_user.admin? )
    @users = User.all.order('username')
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render '/404' if !( logged_in? && current_user.admin? )
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    render '/404' if !( logged_in? && current_user.admin? )
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session['user_id'] = @user.id
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    render '/404' if !( logged_in? && current_user.admin? )
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    render '/404' if !( logged_in? && current_user.admin? )
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def make_admin
    render '/404' if !( logged_in? && current_user.admin? )
    User.find_by(id: params['user_id']).update_attributes(admin: true)
    redirect_to users_path
  end

  def remove_admin
    render '/404' if !( logged_in? && current_user.admin? )
    User.find_by(id: params['user_id']).update_attributes(admin: false)
    redirect_to users_path
  end

  def make_work_study
    render '/404' if !( logged_in? && current_user.admin? )
    User.find_by(id: params['user_id']).update_attributes(work_study: true)
    redirect_to users_path
  end

  def remove_work_study
    render '/404' if !( logged_in? && current_user.admin? )
    User.find_by(id: params['user_id']).update_attributes(work_study: false)
    redirect_to users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
