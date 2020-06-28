require "rails_helper"

RSpec.describe Team, type: :model do
  it "creates a valid user" do
    team = build(:team)
    user = create(:user)
    team.user_id = user.id
    expect(team).to be_valid
  end

  describe "#generic_name" do
    it "sets a generic name" do
      user = create(:user)
      team = build(:team, name: "")
      team.user_id = user.id
      expect(team).to be_valid
    end

    it "is valid even when no name given" do
      user = create(:user)
      team = build(:team, name: nil)
      team.user_id = user.id
      expect(team).to be_valid
    end
  end
end