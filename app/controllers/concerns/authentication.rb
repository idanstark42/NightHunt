require 'active_support/concern'

module Authentication
  extend ActiveSupport::Concern

  ADMIN_USERNAME = 'admin'

  def do_login

  end

  def authenticate_user
    redirect_to '/403' unless params[:authentication] && Team.find_by_id(params[:authentication])
  end

  def authenticate_admin
    redirect_to '/403' unless params[:authentication] && (team = Team.find_by_id(params[:authentication])) && team[:username] = ADMIN_USERNAME
  end

end