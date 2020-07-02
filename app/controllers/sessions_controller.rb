class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash.notice = "Login Successfull"
      redirect_to user_path(user)
    else
      flash.alert = "Login failed - Username or Password incorrect"
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    flash.notice = "Logout Successfull"
    redirect_to root_path
  end
end
