class TeamsController < ApplicationController
  include ApplicationHelper

  before_action :require_login
  before_action :find_team_by_id
  skip_before_action :require_login, only: %i[index show]
  skip_before_action :find_team_by_id, only: %i[index new trainer_teams create]

  def index
    @teams = Team.all
  end

  def show
    @user = User.find(@team.user_id)
    @pokemons = @team.pokemons
  end

  def new
    @team = Team.new
    @user = User.find(params[:user_id])
    @pokemons = Pokemon.all
  end

  def create
    # "team"=>{"name"=>"", "description"=>"", "pokemon_ids"=>["", "33", "125", "529", "951"]}
    @user = User.find(params[:user_id])
    @team = Team.new(team_params)
    if @team.save
      successfull_redirect(@team, "created team")
    else
      @pokemons = Pokemon.all
      render :new
    end
  end

  def edit
    @user = User.find(@team.user.id)
    @pokemons = Pokemon.all
  end

  def update
    if @team.update(team_params)
      successfull_redirect(@team, "updated")
    else
      @user = @team.user
      @pokemons = Pokemon.all
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to user_trainer_teams_path(User.find(params[:user_id]))
  end

  def trainer_teams
    @user = User.find(params[:user_id])
    @teams = @user.teams
  end

private

  def team_params
    # coming back with "" first in the `pokemon_ids` for whatever reason
    params[:team][:pokemon_ids].delete "" if params[:team].key?(:pokemon_ids)
    params.require(:team).permit(:name, :user_id, :description, pokemon_ids: [])
  end

  def require_login
    logged_in?(User.find_by(id: params[:user_id]))
  end

  def successfull_redirect(team, type)
    flash.notice = "Successfully #{type}!"
    redirect_to user_trainer_teams_path(team.user)
  end

  def find_team_by_id
    @team = Team.find(params[:id])
  end
end
