require "rails_helper"

RSpec.describe Generation, type: :model do
  it "creates valed generation" do
    expect(build(:generation)).to be_valid
  end
  it "gives a pokemon a generation" do
    create(:generation)
    pokemon = create(:pokemon, generation: Generation.first)
    expect(pokemon.generation.name).to eq("Gen 1")
  end
end