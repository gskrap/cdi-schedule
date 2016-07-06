class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all.order('last_name')
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    render '/404' if !( logged_in? && current_user.admin? )
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
    render '/404' if !( logged_in? && current_user.admin? )
  end

  # POST /teachers
  # POST /teachers.json
  def create
    render '/404' if !( logged_in? && current_user.admin? )
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teachers_path, notice: 'Teacher was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    render '/404' if !( logged_in? && current_user.admin? )
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to teachers_path, notice: 'Teacher was successfully updated.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    render '/404' if !( logged_in? && current_user.admin? )
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def classes
    @teacher = Teacher.find(params['teacher_id'])
  end

  def pickups
    render '/404' if !( logged_in? && current_user.admin? )
    @teachers = Teacher.all.order('arriving')
    @days = Teacher.all.map{ |t| t.arriving.to_date }.uniq
  end

  def hours
    render '/404' if !( logged_in? && current_user.admin? )
    @teachers = Teacher.all.order('last_name')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :email, :phone_number, :bio, :img_url, :arriving, :leaving)
    end
end
