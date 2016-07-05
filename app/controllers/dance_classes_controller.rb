class DanceClassesController < ApplicationController
  before_action :set_dance_class, only: [:show, :edit, :update, :destroy]

  # GET /dance_classes
  # GET /dance_classes.json
  def index
    @group_a_classes = Group.find_by(name: "Group A").dance_classes.order('start')
    @group_b_classes = Group.find_by(name: "Group B").dance_classes.order('start')
    @days = DanceClass.all.map{ |c| c.start.to_date }.uniq
  end

  # GET /dance_classes/1
  # GET /dance_classes/1.json
  def show
  end

  # GET /dance_classes/new
  def new
    @dance_class = DanceClass.new
  end

  # GET /dance_classes/1/edit
  def edit
  end

  # POST /dance_classes
  # POST /dance_classes.json
  def create
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
      params.require(:dance_class).permit(:name, :teacher_id, :second_teacher_id, :location_id, :group_id, :style, :start, :end)
    end
end
