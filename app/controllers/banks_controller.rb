class BanksController < ApplicationController
  layout 'accountManagement'

  def index
    user_id = User.find_by_session_id(cookies[:session_id]).id
    @banks = BankAccount.where(user_id: user_id).order(:id)

  end

  def create
    user_id = User.find_by_session_id(cookies[:session_id]).id
    BankAccount.create(user_id: user_id, bank_name: params[:bank_name], account_number: params[:account_number], routing_number: params[:routing_number])

    redirect_to :action => :index, status: 303
  end

  def destroy
    user_id = User.find_by_session_id(cookies[:session_id]).id
    bank = BankAccount.find_by(id: params[:id], user_id: user_id)
    if bank
      bank.destroy
    end
    redirect_to :action => :index, status: 303

  end
end