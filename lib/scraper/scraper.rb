require "nokogiri"
require "httparty"

class Scraper
  SITE = "https://pokemondb.net/pokedex/all".freeze
  class << self
    # scrape pokemon.db for all pokemon
    # returns array of pokemon hashes
    # {
    #   original_id, name, type_1, type_2,
    #   total, hp, attack, defense, sp_attack, sp_defense, speed
    # }
    def scrape
      html = Nokogiri::HTML(HTTParty.get(SITE).body)
      pokemons = []
      html.css("#pokedex > tbody:nth-child(2) > tr").each do |pokemon|
        data = {}
        data.merge!(add_general_data(pokemon))
        data.merge!(add_stat_data(pokemon))
        pokemons << data.to_hash
      end
      pokemons
    end

  private

    # adds the general information for a pokemon
    # @param pokemon [Nokogiri Object] single `tr` element in the pokemon table
    # @return [Hash] general data in the form of strings and ints
    def add_general_data(pokemon)
      id = "td:nth-child(1) > span:nth-child(2)"
      name = "td:nth-child(2) > a:nth-child(1)"
      type1 = "td:nth-child(3) > a:nth-child(1)"
      type2 = "td:nth-child(3) > a:nth-child(3)"
      image_link = "td:nth-child(1) > span:nth-child(1)"
      rubocop_yelled_at_me = pokemon.css(image_link).children.first&.attributes

      {
        original_id: css_text(pokemon, id),
        name: css_text(pokemon, name, false),
        type_1: css_text(pokemon, type1, false),
        type_2: css_text(pokemon, type2, false),
        img_link: rubocop_yelled_at_me["data-src"].value || nil,
      }
    end

    # adds the general stat information for a pokemon
    # @param pokemon [Nokogiri Object] single `tr` element in the pokemon table
    # @return [Hash] stat data in the form of ints
    def add_stat_data(pokemon)
      css_selector = ->(child) { "td:nth-child(#{child})" }
      {
        total: css_text(pokemon, css_selector.call(4)),
        hp: css_text(pokemon, css_selector.call(5)),
        attack: css_text(pokemon, css_selector.call(6)),
        defense: css_text(pokemon, css_selector.call(7)),
        sp_attack: css_text(pokemon, css_selector.call(8)),
        sp_defense: css_text(pokemon, css_selector.call(9)),
        speed: css_text(pokemon, css_selector.call(10)),
      }
    end

    # css text of a given css element
    # @param pokemon [Nokogiri Object] single `tr` element in the pokemon table
    # @param css_selector [String] the element of the object we want
    # @param int_flag [Boolean] defaults to true to turn string into int
    # @return [Integer, String] inner HTML data
    def css_text(pokemon, css_selector, int_flag = true)
      text = pokemon.css(css_selector).children.first&.text
      int_flag ? text.to_i : text
    end
  end
end
