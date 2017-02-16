class LoginController < ApplicationController
  def index
    if params[:username] && params[:password] #logging in with params in header
        #here check username and password set cookie if correct and redirect to home
      cookies[:session_id] = '123'
      redirect_to '/'
    end

  end

  def create #not used in bad coding
  end
end
