class Area < ActiveRecord::Base

  belongs_to :team
  has_many :controls
  has_many :teams, :through => :controls
  has_many :flags

  def current_team_control
    current_teams = controls.find_by_isOver(false)
    if current_teams
      current_teams
    else
      { team: nil }
    end
  end

  def status_hash(team)
    {
        area_id: id,
        controlling_team: current_team_control[:team],
        points: points,
        flags_count: flags.count,
        was_controlled: teams.include?(team)
    }
  end

  def transfer_control(team_id)
    new_team = Team.find_by_id(team_id)
    current_team_control.isOver = true
    current_team_control.save
    Control.create team: new_team, area: self, isOver: false
  end

end
