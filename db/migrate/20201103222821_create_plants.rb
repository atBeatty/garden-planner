class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :species
      t.integer :soil
      t.integer :water
      t.integer :light
      t.integer :temp

      t.integer :user_id
      t.integer :garden_id


      t.timestamps
    end
  end
end
