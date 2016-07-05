class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    render '/404' if !( logged_in? && current_user.admin? )
    @locations = Location.all.order('name')
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    render '/404' if !( logged_in? && current_user.admin? )
  end

  # GET /locations/new
  def new
    render '/404' if !( logged_in? && current_user.admin? )
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
    render '/404' if !( logged_in? && current_user.admin? )
  end

  # POST /locations
  # POST /locations.json
  def create
    render '/404' if !( logged_in? && current_user.admin? )
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to locations_path, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    render '/404' if !( logged_in? && current_user.admin? )
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to locations_path, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    render '/404' if !( logged_in? && current_user.admin? )
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name)
    end
end
