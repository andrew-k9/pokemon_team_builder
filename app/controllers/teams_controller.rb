class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @user = User.find(@team.user_id)
    @pokemons = @team.pokemons
  end
end
