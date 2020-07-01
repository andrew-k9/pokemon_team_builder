FactoryBot.define do
  factory :team do
    name "Champion Team"
    description "..."
    before(:create) do |team|
      po = create(:pokemon)
      team.pokemons << po
    end
  end
end