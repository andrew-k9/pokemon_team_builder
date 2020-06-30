class PokemonsController < ApplicationController
  def index
    # "gen"=>{"gen_id"=>"3"}
    @pokemons = params.key?(:gen) ? Pokemon.gen_search(params[:gen][:gen_id]) : Pokemon.all
    Gens.populate
    @gens = Gens.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

private

  def gen_params
    params.require(:gen).permit(:gen_id)
  end
end
