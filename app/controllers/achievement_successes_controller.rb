class AchievementSuccessesController < ApplicationController
  before_action :set_achievment_success, only: [:show, :edit, :update, :destroy]

  # GET /achievement_successes
  # GET /achievement_successes.json
  def index
    @achievment_successes = AchievementSuccess.all
  end

  # GET /achievement_successes/1
  # GET /achievement_successes/1.json
  def show
  end

  # GET /achievement_successes/new
  def new
    @achievment_success = AchievementSuccess.new
  end

  # GET /achievement_successes/1/edit
  def edit
  end

  # POST /achievement_successes
  # POST /achievement_successes.json
  def create
    @achievment_success = AchievementSuccess.new(achievment_success_params)

    respond_to do |format|
      if @achievment_success.save
        format.html { redirect_to @achievment_success, notice: 'Achievement success was successfully created.' }
        format.json { render :show, status: :created, location: @achievment_success }
      else
        format.html { render :new }
        format.json { render json: @achievment_success.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achievement_successes/1
  # PATCH/PUT /achievement_successes/1.json
  def update
    respond_to do |format|
      if @achievment_success.update(achievment_success_params)
        format.html { redirect_to @achievment_success, notice: 'Achievement success was successfully updated.' }
        format.json { render :show, status: :ok, location: @achievment_success }
      else
        format.html { render :edit }
        format.json { render json: @achievment_success.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievement_successes/1
  # DELETE /achievement_successes/1.json
  def destroy
    @achievment_success.destroy
    respond_to do |format|
      format.html { redirect_to achievment_successes_url, notice: 'Achievement success was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievment_success
      @achievment_success = AchievementSuccess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achievment_success_params
      params.require(:achievment_success).permit(:achievment_id, :team_id)
    end
end
