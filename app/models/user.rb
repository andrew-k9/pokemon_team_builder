class User < ApplicationRecord
  has_many :teams
  has_secure_password

  validates :name, presence: true
  validates :username, uniqueness: true, presence: true, format: { with: /\A[-_a-zA-Z0-9]+\Z/ }
  validates :password_digest, presence: true
  validates :password, confirmation: true
  validates :about, length: { maximum: 256 }
end
