class BankTransferController < ApplicationController
  layout 'accountManagement'
  def index
    user_id = User.find_by_session_id(cookies[:session_id]).id
    @banks = BankAccount.where(user_id: user_id).order(:id)
  end

  def create
    user = User.find_by_session_id(cookies[:session_id])
    if params[:bank_id]
      if params[:transfer_type] == 'deposit'
        if params[:withdrawal_amount].to_f < user.money
          user.money -= params[:withdrawal_amount].to_f
          user.save
          redirect_to '/bank_transfer', :flash => { :message => "Funds Transfer Successful" }

        else
          redirect_to '/bank_transfer', :flash => { :error => "Insufficient Funds" }
        end
      else
        user.money += params[:withdrawal_amount].to_f
        user.save
        redirect_to '/bank_transfer', :flash => { :message => "Funds Transfered Successful" }

      end
    else
      redirect_to '/bank_transfer', :flash => { :error => "Error: Select a bank" }
    end

  end
end
