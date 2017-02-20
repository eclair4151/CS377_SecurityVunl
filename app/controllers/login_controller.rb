class LoginController < ApplicationController
  skip_before_action :authenticate_user

  def index
    if cookies[:session_id] #session is valid
      redirect_to '/'
      return
    end

    if params[:username] && params[:password] #logging in with params in header
        #here check username and password set cookie if correct and redirect to home
      cookies[:session_id] = '123'
      redirect_to '/'
    end
  end

  def create #not used in bad coding
  end
end
