class AddGenerationToPokemons < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :generation, :integer
  end
end
