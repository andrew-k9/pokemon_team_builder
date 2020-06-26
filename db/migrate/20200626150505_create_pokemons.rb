# {
#   :original_id=>1,
#   :name=>"Bulbasaur",
#   :type_1=>"Grass",
#   :type_2=>"Poison",
#   :img_link=>
#    "https://img.pokemondb.net/sprites/sword-shield/icon/bulbasaur.png",
#   :total=>318,
#   :hp=>45,
#   :attack=>49,
#   :defense=>49,
#   :sp_attack=>65,
#   :sp_defense=>65,
#   :speed=>49
# }
class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.integer :original_id
      t.string :name
      t.string :type_1
      t.string :type_2
      t.string :img_link
      t.integer :total
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :sp_attack
      t.integer :sp_defense
      t.integer :speed

      t.timestamps null: false
    end
  end
end
