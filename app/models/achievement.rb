class Achievement < ActiveRecord::Base

  has_many :achievement_success
  has_many :teams, :through => achievment_success

end