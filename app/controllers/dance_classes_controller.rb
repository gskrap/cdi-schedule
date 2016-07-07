class DanceClassesController < ApplicationController
  before_action :set_dance_class, only: [:show, :edit, :update, :destroy]

  # GET /dance_classes
  # GET /dance_classes.json
  def index
    render '/404' if !( logged_in? && current_user.admin? )
    @group_a_classes = Group.find_by(name: "Group A").dance_classes.order('start')
    @group_b_classes = Group.find_by(name: "Group B").dance_classes.order('start')
    @men_classes = Group.find_by(name: "Group C").dance_classes.order('start')
    @alumni_classes = Group.find_by(name: "Group D").dance_classes.order('start')
    @days = DanceClass.all.map{ |c| c.start.to_date }.uniq
    @men_days = @men_classes.map{ |c| c.start.to_date }.uniq
    @alumni_days = @alumni_classes.map{ |c| c.start.to_date }.uniq
  end

  # GET /dance_classes/1
  # GET /dance_classes/1.json
  def show
    render '/404' if !( logged_in? && current_user.admin? )
  end

  # GET /dance_classes/new
  def new
    render '/404' if !( logged_in? && current_user.admin? )
    @dance_class = DanceClass.new
  end

  # GET /dance_classes/1/edit
  def edit
    render '/404' if !( logged_in? && current_user.admin? )
  end

  # POST /dance_classes
  # POST /dance_classes.json
  def create
    render '/404' if !( logged_in? && current_user.admin? )
    @dance_class = DanceClass.new(dance_class_params)

    respond_to do |format|
      if @dance_class.save
        format.html { redirect_to dance_classes_path, notice: 'Dance class was successfully created.' }
        format.json { render :show, status: :created, location: @dance_class }
      else
        format.html { render :new }
        format.json { render json: @dance_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dance_classes/1
  # PATCH/PUT /dance_classes/1.json
  def update
    render '/404' if !( logged_in? && current_user.admin? )
    respond_to do |format|
      if @dance_class.update(dance_class_params)
        format.html { redirect_to dance_classes_path, notice: 'Dance class was successfully updated.' }
        format.json { render :show, status: :ok, location: @dance_class }
      else
        format.html { render :edit }
        format.json { render json: @dance_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dance_classes/1
  # DELETE /dance_classes/1.json
  def destroy
    render '/404' if !( logged_in? && current_user.admin? )
    @dance_class.destroy
    respond_to do |format|
      format.html { redirect_to dance_classes_url, notice: 'Dance class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dance_class
      @dance_class = DanceClass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dance_class_params
      params.require(:dance_class).permit(:name, :teacher_id, :second_teacher_id, :location_id, :for_group_a, :for_group_b, :for_group_c, :for_group_d, :style, :start, :end, :is_hidden)
    end
end
