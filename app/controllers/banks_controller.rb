class BanksController < ApplicationController
  layout 'accountManagement'

  def index
  end

  def create
    user_id = Users.find_by_session_id(cookies[:session_id]).id
    BankAccounts.create(user_id: user_id, bank_name: params[:bank_name], account_number: params[:account_number], routing_number: params[:routing_number])

    redirect_to '/banks'
  end

  def destroy
    bank = BankAccounts.find_by(id: params[:id])
    bank.destroy

    redirect_to '/banks'
  end
end