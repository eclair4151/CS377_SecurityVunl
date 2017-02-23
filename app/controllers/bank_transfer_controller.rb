class BankTransferController < ApplicationController
  layout 'accountManagement'
  def index
    user_id = User.find_by_session_id(cookies[:session_id]).id
    @banks = BankAccount.where(user_id: user_id).order(:id)
  end

  def create
  end
end
