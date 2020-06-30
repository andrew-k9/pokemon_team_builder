require "rails_helper"

RSpec.describe Pokemon, type: :model do
  it "creates a valid pokemon" do
    expect(build(:pokemon)).to be_valid
  end

  describe "validations" do
    it "has all presence fields validated" do
      pokemon = build( :pokemon,
        name: nil,
        original_id: nil,
        type_1: nil,
        total: nil,
        hp: nil,
        attack: nil,
        defense: nil,
        sp_attack: nil,
        sp_defense: nil
      )
      expect(pokemon).to be_invalid
    end

    it "is valid with the non-essential fields nil" do
      pokemon = build(:pokemon, type_2: nil, img_link: nil)
      expect(pokemon).to be_valid
    end
  end

  describe "associations" do
    it "can have many teams" do
      ua = create(:user)
      ub = create(:user, username: "BBBB")
      a = create(:team, name: "Team A", user_id: ua.id)
      b = create(:team, name: "Team B", user_id: ub.id)
      bulb = create(:pokemon)
      a.pokemons << bulb
      b.pokemons << bulb
      expect(bulb.teams.count).to eq(2)
    end
  end

  # TODO: Why does scope fail here and not in the console???
  describe "scopes" do
    it "has the right gen 1 result" do
      pokemon1 = create(:pokemon)
      expect(Pokemon.gen_1.first.name).to eq("Venusaur")
    end
  end
end