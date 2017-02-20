class ProfileController < ApplicationController
  layout 'accountManagement'
  def index
    @firstname = 'Jane'
    @lastname = 'Doe'
    @email = 'janedoe@email.com'
    @pass = 'pass'
    @money = '$60'
  end

  def create
  end
end
