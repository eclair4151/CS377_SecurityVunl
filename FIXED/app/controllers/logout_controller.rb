class LogoutController < ApplicationController
  skip_before_action :authenticate_user

  def index
    cookies.delete :session_id
    redirect_to '/login'
  end
end
