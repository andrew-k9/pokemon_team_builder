require_relative "../rails_helper.rb"
require "pry"
describe "Controller Test: Pokemon", type: :feature do
  it "can visit /pokemons when not logged in" do
    visit "/pokemons"
    expect(current_path).to eq("/pokemons")
    expect(page).to have_content("Pokemon")
  end

  # TODO: this does not click, the error is `Obsolete #<Capybara::Node::Element>`
  it "can select a generation and show it" do
    visit "/pokemons"
    # select("Gen 4", from: "gen-search")
    find("#gen-search").find(:xpath, "select/option[4]").select_option
    click("Search")
    binding.pry
    expect(page).to have_content("Turtwig")
  end
end