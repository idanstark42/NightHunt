class AreasController < ApplicationController

  before_action :authenticate_admin, :except => [:riddle, :solve_riddle]
  before_action :set_area, only: [:show, :edit, :update, :destroy, :riddle, :solve_riddle]

  # GET /areas
  # GET /areas.json
  def index
    @areas = Area.all
  end

  # GET /areas/1
  # GET /areas/1.json
  def show
  end

  # GET /areas/new
  def new
    @area = Area.new
  end

  # GET /areas/1/edit
  def edit
  end

  # POST /areas
  # POST /areas.json
  def create
    @area = Area.new(area_params)

    respond_to do |format|
      if @area.save
        format.html { redirect_to @area, notice: 'Area was successfully created.' }
        format.json { render :show, status: :created, location: @area }
      else
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /areas/1
  # PATCH/PUT /areas/1.json
  def update
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to @area, notice: 'Area was successfully updated.' }
        format.json { render :show, status: :ok, location: @area }
      else
        format.html { render :edit }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas/1
  # DELETE /areas/1.json
  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: 'Area was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def riddle
    respond_to do |format|
      format.json {render json: { riddle: @area.riddle_text.html_safe } }
    end
  end

  def solve_riddle
    if @area.riddle_answer == params[:answer]
      area.transfer_controler params[:authentication]
      respond_to do |format|
        format.json {render json: { result: true, points: area.points } }
      end
    else
      respond_to do |format|
        format.json {render json: { result: false } }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_params
      params.require(:area).permit(:x_coord, :y_coord, :riddle_text, :riddle_answer, :points)
    end
end
