class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
    @teams = @user.teams
  end

  def new
    @user = User.new
  end

  def update; end

  def create
    # "user"=>{"username"=>"Ash Ketchum", "password"=>"2501", "password_confirmation"=>"2501", "about"=>"I will be the pokemon master!"}
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :name, :about)
  end
end
