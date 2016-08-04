
module Authentication

  ADMIN_USERNAME = 'admin'

  def login

  end

  def authenticate_user
    params[:authentication] && Team.find_by_id(params[:authentication])
  end

  def authenticate_admin
    (team = authenticate_user) && team[:username] = ADMIN_USERNAME
  end

end