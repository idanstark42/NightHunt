class Area < ActiveRecord::Base

  has_many :controls
  has_many :teams, :through => :controls, :as => 'controlling_teams'
  has_many :flags

end
