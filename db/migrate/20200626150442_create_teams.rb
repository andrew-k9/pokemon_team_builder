class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
