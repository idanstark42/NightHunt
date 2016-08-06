class Area < ActiveRecord::Base

  has_many :controls
  has_many :teams, :through => :controls
  has_many :flags

  def status_hash(team)
    {
        controlling_team: controls.where { |control| !control.isOver }.first,
        points: points,
        flags_count: flags.count,
        was_controlled: teams.include?(team)
    }
  end

end
