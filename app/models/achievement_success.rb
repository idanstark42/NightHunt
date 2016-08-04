class AchievementSuccess < ActiveRecord::Base

  belongs_to :achievement
  belongs_to :team

end