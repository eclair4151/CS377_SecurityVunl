class HomeController < ApplicationController
  def index
    if not cookies[:session_id]
      redirect_to "/login"
    end
  end
end
