class LoginController < ApplicationController
  skip_before_action :authenticate_user
  layout 'application'

  def index
    if cookies[:session_id] #session is valid
      redirect_to '/'
      return
    end

    if params[:email] && params[:password] #logging in with params in header
     user = Users.find_by(email: params[:email] , password: params[:password] )
     if user
       ses_id = SecureRandom.hex(16)
       user.session_id = ses_id
       user.save
       cookies[:session_id] = ses_id
       redirect_to '/'
       return
     else
       redirect_to '/login'
     end
    end
  end

  def create #not used in bad coding
  end
end
