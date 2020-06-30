class TeamsController < ApplicationController
  include ApplicationHelper

  before_action :require_login
  skip_before_action :require_login, only: %i[index show]

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
    @user = User.find(params[:user_id])
    @pokemons = Pokemon.all
  end

  def create
    # "team"=>{"name"=>"", "description"=>"", "pokemon_ids"=>["", "33", "125", "529", "951"]}
    @user = User.find(params[:user_id])
    @team = Team.new(team_params)
    if team_has_right_number? && @team.save
      successfull_redirect(@team, "created team")
    else
      @pokemons = Pokemon.all
      @team.errors.add(:pokemon, "Count of #{params[:team][:pokemon_ids].count} must be greater than 0 at most 6!")
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
    @user = User.find(params[:user_id])
    @pokemons = Pokemon.all
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      successfull_redirect(@team, "updated")
    else
      render :update
    end
  end

  def destroy
    Team.find(params[:id]).destroy
    redirect_to user_trainer_teams_path(User.find(params[:user_id]))
  end

  def trainer_teams
    @user = User.find(params[:user_id])
    @teams = @user.teams
  end

private

  def team_params
    params[:team][:pokemon_ids].delete ""
    params.require(:team).permit(:name, :user_id, :description, pokemon_ids: [])
  end

  def require_login
    logged_in?(User.find_by(id: params[:user_id]))
  end

  def successfull_redirect(team, type)
    flash.notice = "Successfully #{type}!"
    redirect_to user_trainer_teams_path(team.user)
  end

  def team_has_right_number?
    count = params[:team][:pokemon_ids].count
    count.positive? && count < 7
  end
end
