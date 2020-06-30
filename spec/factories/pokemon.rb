FactoryBot.define do
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
    factory :pokemon_with_team do
      after(:create) do |pokemon|
        create(:team, pokemon: pokemon)
      end
    end
  end
end
