class ConnectionsController < ApplicationController
  helper SessionsHelper
  before_action :logged_in_user?

  def index
    # All connections where sender or recipient is ME
    @connections = Connection.of(current_user).lasted_first
    if params[:user_id]
      @user = User.find(params[:user_id])
      @connections = @connections.of(@user)
      @title = 'from ' + @user.name
    else
      @title = 'all connections'
    end
  end

  def in
    @connections = Connection.to(current_user).lasted_first
    @title = 'in connections'
  end

  def out
    @connections = Connection.from(current_user).lasted_first
    @title = 'out connections'
  end

  def new
    @user = User.find(params[:user_id])
    @connection = current_user.connections.build(recipient_id: params[:user_id])
  end

  def create
    @connection = current_user.connections.build(recipient_id: params[:user_id])
    @initial = Message.new initial_params
    @connection.initial = @initial
    if @initial.save && @connection.save!
      redirect_to out_connections_path
    else
      flash[:error] = 'Cannot send the new connection'

    end
  end

  def show
    @connection = Connection.find(params[:id])
  end

  def update
    @connection = Connection.find(params[:id])
    if @connection
      @reply = Message.new reply_params
      if @reply.save
        @connection.update(reply: @reply)
      else
        flash[:error] = 'Cannot create message'
      end
    end

    redirect_to in_connections_path
  end

  private

  def logged_in_user?
    if !logged_in?
      redirect_to login_path
    end
  end

  def connection_params
    params.require(:connection).permit(:sender_id, :recipient_id)
  end

  def initial_params
    params.require(:connection).require(:initial).permit(:content)
  end

  def reply_params
    params.require(:connection).require(:reply).permit(:content)
  end
end
