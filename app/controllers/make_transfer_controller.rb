class MakeTransferController < ApplicationController
  def index
    #in correct get request to make a transfer
    user =  User.find_by_session_id(cookies[:session_id])
    reciever = User.find_by_email(params[:email])
    if reciever
      if params[:transfer_type] == "send"
        user.sent_transactions.create(recipient_id: reciever.id, amount: params[:amount], message: params[:message])
        user.money -= params[:amount].to_f
        user.save
        reciever.money += params[:amount].to_f
        reciever.save
        redirect_to '/transfer', :flash => { :message => "Funds Successfully Sent" }
      else
        user.sent_requests.create(recipient_id: reciever.id, amount: params[:amount], message: params[:message])
        redirect_to '/transfer', :flash => { :message => "Funds Successfully Requested" }
      end

    else
      redirect_to '/transfer', :flash => { :error => "Account Not Found" }
    end
  end
end
