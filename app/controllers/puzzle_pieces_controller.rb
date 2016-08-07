class PuzzlePiecesController < ApplicationController

  before_action :authenticate_admin, :except => [:get]
  before_action :authenticate_user, :only => [:get]
  before_action :set_puzzle_piece, only: [:show, :edit, :update, :destroy]

  # GET /puzzle_pieces
  # GET /puzzle_pieces.json
  def index
    @puzzle_pieces = PuzzlePiece.all
  end

  # GET /puzzle_pieces/1
  # GET /puzzle_pieces/1.json
  def show
  end

  # GET /puzzle_pieces/new
  def new
    @puzzle_piece = PuzzlePiece.new
  end

  # GET /puzzle_pieces/1/edit
  def edit
  end

  # POST /puzzle_pieces
  # POST /puzzle_pieces.json
  def create

    uploaded_file = params[:person][:picture]
    File.open(Rails.root.join('public', 'uploads', 'puzzle', uploaded_file.original_filename), 'wb') do |file|
      file.write uploaded_file.read
    end

    @puzzle_piece = PuzzlePiece.new(puzzle_piece_params)

    respond_to do |format|
      if @puzzle_piece.save
        format.html { redirect_to @puzzle_piece, notice: 'Puzzle piece was successfully created.' }
        format.json { render :show, status: :created, location: @puzzle_piece }
      else
        format.html { render :new }
        format.json { render json: @puzzle_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /puzzle_pieces/1
  # PATCH/PUT /puzzle_pieces/1.json
  def update
    respond_to do |format|
      if @puzzle_piece.update(puzzle_piece_params)
        format.html { redirect_to @puzzle_piece, notice: 'Puzzle piece was successfully updated.' }
        format.json { render :show, status: :ok, location: @puzzle_piece }
      else
        format.html { render :edit }
        format.json { render json: @puzzle_piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /puzzle_pieces/1
  # DELETE /puzzle_pieces/1.json
  def destroy
    @puzzle_piece.destroy
    respond_to do |format|
      format.html { redirect_to puzzle_pieces_url, notice: 'Puzzle piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get
    team = team_in_session
    if team.deserve_another_piece? && params[:piece_x] && params[:piece_y]
      puzzle_piece = PuzzlePiece.find(x_coord: params[:piece_x], y_coord: params[:piece_y])
      PuzzlePieceReveal.create :puzzle_piece => puzzle_piece, :team => team
      respond_to do |format|
        format.json { render json: { piece: puzzle_piece } }
      end
    else
      respond_to do |format|
        format.json { render json: { piece: nil } }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_puzzle_piece
      @puzzle_piece = PuzzlePiece.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def puzzle_piece_params
      params.require(:puzzle_piece).permit(:x_coord, :y_coord, :image_uri, :note)
    end
end
