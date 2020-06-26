class User < ApplicationRecord
  has_many :teams
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true
  validates :password, presence: true
  validates :about, length: { maximum: 256 }
end
