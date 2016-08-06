class AchievementSuccessesController < ApplicationController

  before_action :authenticate_admin
  before_action :set_achievement_success, only: [:show, :edit, :update, :destroy]

  # GET /achievement_successes
  # GET /achievement_successes.json
  def index
    @achievement_successes = AchievementSuccess.all
  end

  # GET /achievement_successes/1
  # GET /achievement_successes/1.json
  def show
  end

  # GET /achievement_successes/new
  def new
    @achievement_success = AchievementSuccess.new
  end

  # GET /achievement_successes/1/edit
  def edit
  end

  # POST /achievement_successes
  # POST /achievement_successes.json
  def create
    @achievement_success = AchievementSuccess.new(achievement_success_params)

    @achievement_success.team.points += @achievement_success.achievement.points
    @achievement_success.team.save

    respond_to do |format|
      if @achievement_success.save
        format.html { redirect_to @achievement_success, notice: 'Achievement success was successfully created.' }
        format.json { render :show, status: :created, location: @achievement_success }
      else
        format.html { render :new }
        format.json { render json: @achievement_success.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achievement_successes/1
  # PATCH/PUT /achievement_successes/1.json
  def update
    respond_to do |format|
      if @achievement_success.update(achievement_success_params)
        format.html { redirect_to @achievement_success, notice: 'Achievement success was successfully updated.' }
        format.json { render :show, status: :ok, location: @achievement_success }
      else
        format.html { render :edit }
        format.json { render json: @achievement_success.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievement_successes/1
  # DELETE /achievement_successes/1.json
  def destroy
    @achievement_success.destroy
    respond_to do |format|
      format.html { redirect_to achievement_successes_url, notice: 'Achievement success was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievement_success
      @achievement_success = AchievementSuccess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achievement_success_params
      params.require(:achievement_success).permit(:achievement_id, :team_id)
    end
end
