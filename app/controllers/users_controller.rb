class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
    @teams = @user.teams
  end

  def new; end

  def update; end

  def create; end
end
