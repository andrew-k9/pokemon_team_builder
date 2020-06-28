require "rails_helper"

RSpec.describe PokemonTeamMembership, type: :model do
  it "creates a valid membership" do
    user = create(:user)
    team = create(:team, user_id: user.id)
    pokemon = create(:pokemon)
    team.pokemons << pokemon
    expect(PokemonTeamMembership.count).to eq(1)
  end
end