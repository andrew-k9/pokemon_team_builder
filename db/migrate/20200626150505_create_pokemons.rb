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
