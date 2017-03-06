class HomeController < ApplicationController
  layout 'accountManagement'
  def index
    @transactions = Transaction.all.limit(30).order(created_at: :desc)
  end
end
