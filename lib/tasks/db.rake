require "./lib/scraper/scraper.rb"
namespace :db do
  namespace :seed do
    desc "Add in Pokemon"
    task from_pokemondb: :environment do
      pokemon = Scraper.scrape
      puts "Number of mons #{pokemon.length}"
      puts "First one is #{pokemon.first[:name]}"
    end
  end
end