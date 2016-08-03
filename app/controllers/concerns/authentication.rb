
module Authentication

  ADMIN_USERNAME = 'admin'

  def login

  end

  def authenticate_user
    params[:authentication] and Team.find_by_id(params[:authentication])
  end

  def authenticate_admin
    params[:authentication] and team = Team.find_by_id(params[:authentication]) and team[:username] = ADMIN_USERNAME
  end

end