class Achievement < ActiveRecord::Base

  has_many :achievement_successes
  has_many :teams, :through => :achievement_successes

end