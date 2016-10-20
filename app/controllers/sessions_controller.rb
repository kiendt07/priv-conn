class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:success] = 'Login successfully'
        redirect_to root_path
      else
        flash[:error] = ' Login failed'
        render 'new'
      end
    else
      flash[:error] = 'Email is not exist'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'Log out successfully'
    redirect_to root_path
  end
end
