class AchievementsController < ApplicationController
  before_action :set_achievment, only: [:show, :edit, :update, :destroy]

  # GET /achievements
  # GET /achievements.json
  def index
    @achievments = Achievement.all
  end

  # GET /achievements/1
  # GET /achievements/1.json
  def show
  end

  # GET /achievements/new
  def new
    @achievment = Achievement.new
  end

  # GET /achievements/1/edit
  def edit
  end

  # POST /achievements
  # POST /achievements.json
  def create
    @achievment = Achievement.new(achievment_params)

    respond_to do |format|
      if @achievment.save
        format.html { redirect_to @achievment, notice: 'Achievement was successfully created.' }
        format.json { render :show, status: :created, location: @achievment }
      else
        format.html { render :new }
        format.json { render json: @achievment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achievements/1
  # PATCH/PUT /achievements/1.json
  def update
    respond_to do |format|
      if @achievment.update(achievment_params)
        format.html { redirect_to @achievment, notice: 'Achievement was successfully updated.' }
        format.json { render :show, status: :ok, location: @achievment }
      else
        format.html { render :edit }
        format.json { render json: @achievment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievements/1
  # DELETE /achievements/1.json
  def destroy
    @achievment.destroy
    respond_to do |format|
      format.html { redirect_to achievments_url, notice: 'Achievement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievment
      @achievment = Achievement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achievment_params
      params.require(:achievment).permit(:description, :points)
    end
end
