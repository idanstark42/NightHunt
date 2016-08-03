class AchievmentSuccess < ActiveRecord::Base
  belongs_to :achievment
  belongs_to :team
end
