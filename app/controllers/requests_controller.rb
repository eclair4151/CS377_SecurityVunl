class RequestsController < ApplicationController
  layout 'accountManagement'

  def index
    user =  User.find_by_session_id(cookies[:session_id])
    @sent_requests = user.sent_requests.order(:id)
    @received_requests = user.received_requests.order(:id)

  end

  def create
  end
end
