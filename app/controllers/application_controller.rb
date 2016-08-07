require 'concerns/authentication'

class ApplicationController < ActionController::Base
  include Authentication

  protect_from_forgery with: :exception

  before_action :authenticate_user, :except => [:login, :index]

end
