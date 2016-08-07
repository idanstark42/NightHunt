class PuzzlePieceReveal < ActiveRecord::Base
  belongs_to :puzzle_piece
  belongs_to :team
end
