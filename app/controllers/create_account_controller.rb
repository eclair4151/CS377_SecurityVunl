class CreateAccountController < ApplicationController
  skip_before_action :authenticate_user
  skip_before_filter :verify_authenticity_token

  def index
  end

  def create
    ses_id = SecureRandom.hex(16)
    Users.create(session_id: ses_id, email:  params[:email], first_name:  params[:first_name],last_name:  params[:last_name], password:  params[:password],money:  0)
    cookies[:session_id] = ses_id

    redirect_to '/'
  end
end
