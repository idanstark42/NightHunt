class Achievement < ActiveRecord::Base

  has_many :achievement_successes
  has_many :teams, :through => :achievement_successes

  def display_array(team_id)
    team = Team.find_by_id team_id
    Achievement.all.map do |achievement|
      {
          id: achievement.id,
          is_obtained: achievement_successes.where(team: team, achievement: achievement).any?,
          points: points
      }
    end
  end

end