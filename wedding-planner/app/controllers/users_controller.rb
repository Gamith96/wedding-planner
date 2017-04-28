class UsersController < ApplicationController
  def index
    if user_signed_in?
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @user = User.new
  end
end
