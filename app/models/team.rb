class Team < ActiveRecord::Base

  has_secure_password
  has_many :achievement_success
  has_many :achievement, :through => :achievement_success
  has_many :flags
  has_one :area, :as => 'current_area'
  has_many :controls
  has_many :areas, :through => :controls, :as => 'controlled_areas'

  def calculate_points_addition
    pts = 0
    controls.where { |control| !control.isOver }.each do |control|
      area = control.area
      pts += area.points
    end
    pts
  end

end