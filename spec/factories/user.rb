FactoryBot.define do
  factory :user do
    name "Red"
    username "PkMn-trainer-red"
    password_digest "pikachu_25"
    about "..."
    factory :user_with_team do
      after(:create) do |user|
        po = create(:pokemon)
        t = build(:team, user: user)
        t.pokemons << po
        t.save
      end
    end
  end
end
