class ApplicationController < ActionController::Base
  #protect_from_forgery with: :null_session
  before_action :authenticate_user


  def authenticate_user
    if not cookies[:session_id] or not Users.find_by_session_id(cookies[:session_id])
      cookies.delete :session_id
      redirect_to "/login"
    end
  end
end
