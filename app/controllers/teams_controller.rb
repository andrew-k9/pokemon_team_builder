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
    params[:team][:pokemon_ids].delete ""
    @team = Team.new(team_params)
    @team.user = User.find(params[:user_id])
    if @team.save
      flash.notice = "Successfully created team!"
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def edit
    @team = Team.find(params[:id])
    @user = User.find(params[:user_id])
    @pokemons = Pokemon.all
  end

  def update
    params[:team][:pokemon_ids].delete ""
    @team = Team.find(params[:id])
    if @team.update(team_params)
      flash.notice = "Successfully updated!"
      redirect_to team_path(@team)
    else
      render :update
    end
  end

  def destroy; end

private

  def team_params
    params.require(:team).permit(:name, :user_id, :description, pokemon_ids: [])
  end

  def require_login
    logged_in?(User.find_by(id: params[:user_id]))
  end
end
