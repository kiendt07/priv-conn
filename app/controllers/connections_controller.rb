class ConnectionsController < ApplicationController
  helper SessionsHelper
  before_action :logged_in_user

  def index
    redirect_to connections_path(direction: 'in') if params[:direction].nil?
    if params[:direction] == 'in'
      @connections = Connection.where(recipient: current_user)
    end
    if params[:direction] == 'out'
      @connections = Connection.where(sender: current_user)
    end

    @new_connection = Connection.new(sender: current_user)
  end

  def create
    puts connection_params
  end

  private

  def connection_params
    params.require(:connection).permit(:sender_id, :initial)
  end

  def logged_in_user
    if session[:user_id].nil?
      flash[:danger] = 'Please log in'
      redirect_to login_path
    end
  end
end
