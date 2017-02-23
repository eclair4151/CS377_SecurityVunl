class BankTransferController < ApplicationController
  layout 'accountManagement'
  def index
    user_id = Users.find_by_session_id(cookies[:session_id]).id
    @banks = BankAccounts.where(user_id: user_id).order(:id)
  end

  def create
  end
end
