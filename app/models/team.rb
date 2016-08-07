class Team < ActiveRecord::Base

  POINTS_PER_PIECE = 20

  has_secure_password
  has_many :achievement_success
  has_many :achievement, :through => :achievement_success
  has_many :flags
  has_one :area, :as => 'current_area'
  has_many :controls
  has_many :areas, :through => :controls, :as => 'controlled_areas'
  has_many :puzzle_piece_reveals
  has_many :puzzle_pieces, :through => :puzzle_piece_reveals

  def calculate_points_addition
    pts = 0
    current_controls = controls.where(isOver: true).compact
    current_controls.each do |control|
      area = control.area
      pts += area.points
    end
    pts
  end

  def deserve_another_piece?
    right_piece_count = Math.floor(points / Team::POINTS_PER_PIECE)
    right_piece_count > puzzle_pieces.length
  end

end