ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "factory_bot_rails"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  FactoryBot.define do
    factory :user do
      name "Red"
      username "PkMn-trainer-red"
      password_digest "pikachu_25"
      about "..."
      factory :user_with_team do
        after(:create) do |user|
          create(:team, user: user)
        end
      end
    end

    factory :pokemon do
      original_id 3
      name "Venusaur"
      type_1 "Grass"
      type_2 "Poison"
      img_link "frog.png"
      total 525
      hp 45
      attack 49
      defense 49
      sp_attack 65
      sp_defense 65
      speed 45
    end

    factory :team do
      name "Champion Team"
      description "..."
    end
  end
end
