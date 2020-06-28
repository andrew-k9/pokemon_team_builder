class PokemonTeamMembership < ApplicationRecord
  belongs_to :pokemon
  belongs_to :team

  validates :pokemon_id, presence: true
  validates :team_id, presence: true
end
