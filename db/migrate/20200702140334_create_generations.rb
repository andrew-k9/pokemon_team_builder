class CreateGenerations < ActiveRecord::Migration[6.0]
  def change
    create_table :generations do |t|
      t.string :name
      t.timestamps
    end
  end
end
