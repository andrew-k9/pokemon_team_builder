class ChangeGenerationNameToGenerationId < ActiveRecord::Migration[6.0]
  def change
    rename_column :pokemons, :generation, :generation_id
  end
end
