require 'active_support/concern'

module Authentication
  extend ActiveSupport::Concern

  ADMIN_USERNAME = 'admin'

  def do_login
    team = Team.find_by :name => params[:team_name]
    if team && team.authenticate(params[:password])
      session[:authentication] = team[:id]
      respond_to do |format|
        format.json { render :json => { :authentication => team[:id] } }
      end
    else
      session[:authentication] = nil
      respond_to do |format|
        format.json { render :json => { :authentication => nil } }
      end
    end
  end

  def do_logout
    session[:authentication] = nil
  end

  def authenticate_user
    redirect_to '/403' unless session[:authentication] && team_in_session != nil
  end

  def authenticate_admin
    redirect_to '/403' unless session[:authentication] && (team = team_in_session) != nil && team[:name] == ADMIN_USERNAME
  end

  def team_in_session
    Team.find_by_id(session[:authentication])
  end

end