class Area < ActiveRecord::Base

  belongs_to :team
  has_many :controls
  has_many :teams, :through => :controls
  has_many :flags

  def current_team_control
    current_teams = controls.find_by_isOver(false)
    if current_teams
      logger.debug "team_control=#{current_teams}"
      current_teams
    else
      nil
    end
  end

  def current_team
    current_teams = controls.find_by_isOver(false)
    if current_teams
      current_teams.team
    else
      nil
    end
  end

  def status_hash(team)
    {
        area_id: id,
        controlling_team: current_team_control.team,
        points: points,
        flags_count: flags.count,
        was_controlled: teams.include?(team)
    }
  end

  def transfer_control
    new_team = team_in_session
    old_team_control = current_team_control
    if old_team_control
      old_team_control.isOver = true
      old_team_control.save
    end
    Control.create team: new_team, area: self, isOver: false
  end

end
