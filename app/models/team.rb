require_relative "concerns/pokemon_count_validator.rb"

class Team < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :user
  has_many :pokemon_team_memberships
  has_many :pokemons, through: :pokemon_team_memberships

  before_validation :generic_name

  accepts_nested_attributes_for :pokemons

  validates :name, presence: true
  validates_with PokemonCountValidator

  # gives a generic name based on the number of teams
  # the user has already created
  # @return [String] fromatted string
  def generic_name
    user = User.find(user_id)
    self.name = "#{user.name}'s Team ##{user.teams.length + 1}" if name.blank?
  end
end
