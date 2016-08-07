class PuzzlePiece < ActiveRecord::Base

  has_many :puzzle_piece_reveals
  has_many :teams, :through => :puzzle_piece_reveals

end
