class Pokemon < ApplicationRecord
  has_many :pokemon_team_memberships
  has_many :teams, through: :pokemon_team_memberships

  scope :gen_search, ->(gen_number) { where(generation: gen_number) }

  validates :name, presence: true
  validates :original_id, presence: true
  validates :type_1, presence: true
  validates :total, presence: true
  validates :hp, presence: true
  validates :attack, presence: true
  validates :defense, presence: true
  validates :sp_attack, presence: true
  validates :sp_defense, presence: true
end
