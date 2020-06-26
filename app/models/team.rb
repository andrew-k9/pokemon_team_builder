class Team < ApplicationRecord
  belongs_to :user
  has_many :pokemon_team_memberships
  has_many :pokemons, through: :pokemon_team_memberships

  before_validation :generic_name

  # gives a generic name based on the number of teams
  # the user has already created
  # @return [String] fromatted string
  def generic_name
    self.name ||= "#{user.name}'s' team ##{user.teams.length}"
  end
end
