class ProfileController < ApplicationController
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
