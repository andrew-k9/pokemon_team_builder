class Team < ApplicationRecord
  belongs_to :user
  has_many :pokemon_team_memberships
  has_many :pokemons, through: :pokemon_team_memberships

  before_validation :generic_name

  accepts_nested_attributes_for :pokemons

  validates :name, presence: true

  # gives a generic name based on the number of teams
  # the user has already created
  # @return [String] fromatted string
  def generic_name
    user = User.find(user_id)
    self.name = "#{user.name}'s team ##{user.teams.length}" if name.blank?
  end
end
