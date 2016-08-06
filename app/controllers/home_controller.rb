class HomeController < ApplicationController

  def index
  end

  def status
    team = team_in_session
    respond_to do |format|
      format.json { render :json => { xp: team.points,
                                      areas: areas_json_for_team(team),
                                      leading_teams: leader_board
      } }
    end
  end

private
  def areas_json_for_team(team)
    Area.all.map do |area|
      area.status_hash(team)
    end
  end

  def leader_board
    Team.order(:points).take(5).map { |team| { name: team.name, score: team.points } }
  end

end
