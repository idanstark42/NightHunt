class AchievmentSuccessesController < ApplicationController
  before_action :set_achievment_success, only: [:show, :edit, :update, :destroy]

  # GET /achievment_successes
  # GET /achievment_successes.json
  def index
    @achievment_successes = AchievmentSuccess.all
  end

  # GET /achievment_successes/1
  # GET /achievment_successes/1.json
  def show
  end

  # GET /achievment_successes/new
  def new
    @achievment_success = AchievmentSuccess.new
  end

  # GET /achievment_successes/1/edit
  def edit
  end

  # POST /achievment_successes
  # POST /achievment_successes.json
  def create
    @achievment_success = AchievmentSuccess.new(achievment_success_params)

    respond_to do |format|
      if @achievment_success.save
        format.html { redirect_to @achievment_success, notice: 'Achievment success was successfully created.' }
        format.json { render :show, status: :created, location: @achievment_success }
      else
        format.html { render :new }
        format.json { render json: @achievment_success.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achievment_successes/1
  # PATCH/PUT /achievment_successes/1.json
  def update
    respond_to do |format|
      if @achievment_success.update(achievment_success_params)
        format.html { redirect_to @achievment_success, notice: 'Achievment success was successfully updated.' }
        format.json { render :show, status: :ok, location: @achievment_success }
      else
        format.html { render :edit }
        format.json { render json: @achievment_success.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievment_successes/1
  # DELETE /achievment_successes/1.json
  def destroy
    @achievment_success.destroy
    respond_to do |format|
      format.html { redirect_to achievment_successes_url, notice: 'Achievment success was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievment_success
      @achievment_success = AchievmentSuccess.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achievment_success_params
      params.require(:achievment_success).permit(:achievment_id, :team_id)
    end
end
