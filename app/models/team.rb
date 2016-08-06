class Team < ActiveRecord::Base

  has_secure_password
  has_many :achievement_success
  has_many :achievement, :through => :achievement_success
  has_many :flags
  has_one :area, :as => 'current_area'
  has_many :controls
  has_many :areas, :as => 'controlled_areas'

end