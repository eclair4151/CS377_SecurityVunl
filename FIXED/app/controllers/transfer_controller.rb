class TransferController < ApplicationController
  layout 'accountManagement'
  def index
    #page to transfer money
  end

  def create
    user =  User.find_by_session_id(cookies[:session_id])
    reciever = User.find_by_email(params[:email])
    if reciever
      if params[:transfer_type] == "send"
        if user.money > params[:amount].to_f
          user.sent_transactions.create(recipient_id: reciever.id, amount: params[:amount], message: params[:message])

          reciever.money = reciever.money + params[:amount].to_f.round(2)
          reciever.save

          user.money = user.money - params[:amount].to_f.round(2)
          user.save


          redirect_to '/transfer', :flash => { :message => "Funds Successfully Sent" }
        else
          redirect_to '/transfer', :flash => { :error => "Insufficient Funds" }
        end
      else
        user.sent_requests.create(recipient_id: reciever.id, amount: params[:amount], message: params[:message])
        redirect_to '/transfer', :flash => { :message => "Funds Successfully Requested" }
      end

    else
      redirect_to '/transfer', :flash => { :error => "Account Not Found" }
    end
  end
end
