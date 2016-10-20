class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def require_user!
    unless current_user
      redirect_to login_path, flash: { error: 'Please log in first' }
    end
  end
end
