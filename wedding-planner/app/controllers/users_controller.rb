class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    #code
  end
end
