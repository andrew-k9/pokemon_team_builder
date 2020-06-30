require "./lib/scraper/scraper.rb"
require "./lib/helpers.rb"
namespace :db do
  namespace :seed do
    desc "Add in Pokemon from pokemondb"
    task from_pokemondb: :environment do
      pokemon = Scraper.scrape
      pokemon.each { |mon| Pokemon.create!(mon) }
    end

    desc "Add in Generation to pokemon"
    task add_generation: :environment do
      Pokemon.all.each do |pokemon|
        pokemon.update!(generation: gen_select(pokemon.original_id))
      end
    end
  end
end
