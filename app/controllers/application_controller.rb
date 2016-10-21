class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    # If not logged in, return nill
    return nil unless logged_in?
    @current_user ||= User.find session[:user_id]
  end
end
