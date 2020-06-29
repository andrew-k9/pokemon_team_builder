class TeamsController < ApplicationController
  include ApplicationHelper
  before_action :require_login
  skip_before_action :require_login, only: [:index, :show]

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @user = User.find(@team.user_id)
    @pokemons = @team.pokemons
  end

  def new
    @team = Team.new
  end

private

  def require_login
    logged_in?(User.find_by(id: params[:user_id]))
  end

end
