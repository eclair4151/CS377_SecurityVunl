require 'digest'

class CreateAccountController < ApplicationController
  skip_before_action :authenticate_user
  layout 'application'

  def index
  end

  def create
    if User.find_by_email(params[:email])
      redirect_to '/create_account', :flash => { :error => "Email already in use" }
    else
      ses_id = SecureRandom.hex(16)
      pass = Digest::SHA256.hexdigest params[:password]

      User.create(session_id: ses_id, email:  params[:email], first_name:  params[:first_name],last_name:  params[:last_name], password:  pass, money:  0)
      cookies[:session_id] = ses_id
      redirect_to '/'
    end
  end
end
