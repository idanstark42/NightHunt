class PuzzlePieceRevealsController < ApplicationController

  before_action :authenticate_admin, :except => []
  before_action :set_puzzle_piece_reveal, only: [:show, :edit, :update, :destroy]

  # GET /puzzle_piece_reveals
  # GET /puzzle_piece_reveals.json
  def index
    @puzzle_piece_reveals = PuzzlePieceReveal.all
  end

  # GET /puzzle_piece_reveals/1
  # GET /puzzle_piece_reveals/1.json
  def show
  end

  # GET /puzzle_piece_reveals/new
  def new
    @puzzle_piece_reveal = PuzzlePieceReveal.new
  end

  # GET /puzzle_piece_reveals/1/edit
  def edit
  end

  # POST /puzzle_piece_reveals
  # POST /puzzle_piece_reveals.json
  def create
    @puzzle_piece_reveal = PuzzlePieceReveal.new(puzzle_piece_reveal_params)

    respond_to do |format|
      if @puzzle_piece_reveal.save
        format.html { redirect_to @puzzle_piece_reveal, notice: 'Puzzle piece reveal was successfully created.' }
        format.json { render :show, status: :created, location: @puzzle_piece_reveal }
      else
        format.html { render :new }
        format.json { render json: @puzzle_piece_reveal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /puzzle_piece_reveals/1
  # PATCH/PUT /puzzle_piece_reveals/1.json
  def update
    respond_to do |format|
      if @puzzle_piece_reveal.update(puzzle_piece_reveal_params)
        format.html { redirect_to @puzzle_piece_reveal, notice: 'Puzzle piece reveal was successfully updated.' }
        format.json { render :show, status: :ok, location: @puzzle_piece_reveal }
      else
        format.html { render :edit }
        format.json { render json: @puzzle_piece_reveal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puzzle_piece_reveals/1
  # DELETE /puzzle_piece_reveals/1.json
  def destroy
    @puzzle_piece_reveal.destroy
    respond_to do |format|
      format.html { redirect_to puzzle_piece_reveals_url, notice: 'Puzzle piece reveal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puzzle_piece_reveal
      @puzzle_piece_reveal = PuzzlePieceReveal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def puzzle_piece_reveal_params
      params.require(:puzzle_piece_reveal).permit(:puzzle_piece_id, :team_id)
    end
end
