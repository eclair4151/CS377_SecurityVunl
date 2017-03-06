require 'digest'

class LoginController < ApplicationController
  skip_before_action :authenticate_user
  layout 'application'

  def index
    if cookies[:session_id] #session is valid
      redirect_to '/'
    end
  end

  def create #not used in bad coding
    pass = Digest::SHA256.hexdigest params[:password]
    user = User.find_by(email: params[:email] , password: pass )
    if user
      ses_id = SecureRandom.hex(16)
      user.session_id = ses_id
      user.save
      cookies[:session_id] = ses_id
      redirect_to '/'
      return
    else
      redirect_to '/login', :flash => { :error => "Invalid Username or Password" }
    end
  end
end
