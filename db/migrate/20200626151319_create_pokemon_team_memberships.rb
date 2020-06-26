class CreatePokemonTeamMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_team_memberships do |t|
      t.integer :pokemon_id
      t.integer :team_id
      t.timestamps null: false
    end
  end
end
