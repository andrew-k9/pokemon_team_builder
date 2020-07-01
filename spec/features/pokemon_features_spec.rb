require_relative "../rails_helper.rb"
require "pry"

describe "Controller Test: Pokemon", type: :controller do
  it "can visit /pokemons when not logged in" do
    visit "/pokemons"
    expect(current_path).to eq("/pokemons")
    expect(page).to have_content("Pokemon")
  end

  it "can select a generation and show it" do
    create(:pokemon, generation: 1)
    create(:pokemon, name: "Bobmon", generation: 4)
    visit "/pokemons"
    find("#gen-search").find(:xpath, "select/option[4]").select_option
    click_button("Search")
    expect(page).to have_content("Bobmon")
    expect(page).to have_no_content("Venusaur")
  end

  it "can visit a pokemon's show page" do
    pikachu = create(:pokemon, name: "Pikachu")
    visit "/pokemons/#{pikachu.id}"
    expect(page).to have_content("Pikachu")
  end

  it "can visit a pokemon's show page from" do
    create(:pokemon, generation: 1)
    create(:pokemon, original_id: 25, name: "Pikachu", generation: 1)
    visit "/pokemons"
    click_on("Pikachu")
    expect(current_path).to eq("/pokemons/2")
    expect(page).to have_content("Pikachu")
  end
end
