class ProfileController < ApplicationController
  layout 'accountManagement'
  def index
    @user = User.find_by_session_id(cookies[:session_id])
  end

  def create
  end
end
