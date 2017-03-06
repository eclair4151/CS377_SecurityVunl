class RequestsController < ApplicationController
  layout 'accountManagement'

  def index
    user =  User.find_by_session_id(cookies[:session_id])
    @sent_requests = user.sent_requests.order(:id)
    @received_requests = user.received_requests.order(:id)

  end

  def create
    user =  User.find_by_session_id(cookies[:session_id])
    request = user.received_requests.find_by(id: params[:request_id])
    if(params[:type] = 'Send')
      if user.money > request.amount
        sender = request.sender
        sender.money += request.amount
        user.money -= request.amount
        user.sent_transactions.create(recipient_id: sender.id, amount: request.amount,message: request.message)
        user.save
        sender.save
        Request.destroy(request.id)
        redirect_to '/requests', :flash => { :message => "Funds Successfully Sent" }
      else
        redirect_to '/requests', :flash => { :error => "Insufficient Funds" }
      end
    else
      Request.destroy(request.id)
      redirect_to '/requests', :flash => { :message => "Funds Successfully Denied" }
    end
  end
end
