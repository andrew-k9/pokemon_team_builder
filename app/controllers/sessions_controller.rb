class SessionsController < ApplicationController
  def create
    binding.pry
    @user = User.find_by(username: params[:user][:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.alert = "Login failed - Username or Password incorrect"
      redirect_to root_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to "/"
  end
end
