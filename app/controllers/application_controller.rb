class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_user


  def authenticate_user
    if not cookies[:session_id] #and session is valid
      redirect_to "/login"
    end
  end
end
