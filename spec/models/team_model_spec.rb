require "rails_helper"

RSpec.describe Team, type: :model do
  it "creates a valid team" do
    user = create(:user_with_team)
    expect(user.teams.first).to be_valid
  end

  describe "#generic_name" do
    it "sets a generic name" do
      user = create(:user)
      team = build(:team, name: "")
      team.user_id = user.id
      team.save
      expect(team.name).to eq("Red's Team #1")
    end

    it "sets name even when no name given" do
      user = create(:user)
      team = build(:team, name: nil)
      team.user_id = user.id
      team.save
      expect(team.name).to eq("Red's Team #1")
    end
  end

  describe "PokemonTeamCount" do
    it "fails when the count is off" do
      user = create(:user)
      team = build(:team, name: nil)
      team.user_id = user.id
      expect(team).to be_invalid
    end
  end
end