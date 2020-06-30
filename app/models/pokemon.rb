class Pokemon < ApplicationRecord
  has_many :pokemon_team_memberships
  has_many :teams, through: :pokemon_team_memberships

  scope :gen_1, -> { where("original_id < 152") }
  scope :gen_2, -> { where("original_id < 252") }
  scope :gen_3, -> { where("original_id < 387") }
  scope :gen_4, -> { where("original_id < 494") }
  scope :gen_5, -> { where("original_id < 650") }
  scope :gen_8, -> { where("original_id < 722") }
  scope :gen_9, -> { where("original_id < 810") }
  scope :gen_10, -> { where("original_id <= 893") }

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
