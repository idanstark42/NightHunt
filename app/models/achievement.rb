class Achievement < ActiveRecord::Base

  has_many :achievement_successes
  has_many :teams, :through => :achievement_successes

  def self.display_array
    team = team_in_session
    Achievement.all.map do |achievement|
      {
          id: achievement.id,
          is_obtained: AchievementSuccess.where(team: team, achievement: achievement).any?,
          points: achievement.points
      }
    end
  end

end