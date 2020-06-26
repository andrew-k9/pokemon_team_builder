require "./lib/scraper/scraper.rb"
namespace :db do
  namespace :seed do
    desc "Add in Pokemon from pokemondb"
    task from_pokemondb: :environment do
      pokemon = Scraper.scrape
      pokemon.each { |mon| Pokemon.create!(mon) }
    end
  end
end
