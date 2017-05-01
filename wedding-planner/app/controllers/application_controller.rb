class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # private
  # before_filter :if_no_password
  # def if_no_password
  #
  # end
  # def current_user
  #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  # helper_method :current_user
end
