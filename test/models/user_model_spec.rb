require "rails_helper"

RSpec.describe User, type: :model do
  it "creates a valid user" do
    expect(build(:user)).to be_valid
  end

  describe "presence validations for users columns" do
    it "won't be valid without a name" do
      expect(build(:user, name: nil)).to be_invalid
    end

    it "won't be valid without a username" do
      expect(build(:user, username: nil)).to be_invalid
    end

    it "won't be valid without a password" do
      expect(build(:user, password_digest: nil)).to be_invalid
    end
  end

  describe "#about" do
    it "has a length fewer than 256 characters" do
      expect(build(:user, about: "." * 257)).to be_invalid
    end
  end

  describe "#username" do
    it "has only letters, numbers, `-`, and `_`" do
      expect(build(:user, username: "dan++")).to be_invalid
    end

    it "is unique" do
      create(:user)
      dupe = build(:user, name: "Blue")
      expect(dupe).to be_invalid
    end
  end

  describe "associations" do
    it "has many teams" do
    end
  end
end
