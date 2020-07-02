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
      Generation.destroy_all
      8.times { |i| Generation.create!(id: i + 1, name: "Gen #{i + 1}") }
      puts "Added #{Generation.all.length} generations!"
      Pokemon.all.each do |pokemon|
        pokemon.update!(generation_id: gen_select(pokemon.original_id))
      end
    end
  end
end
