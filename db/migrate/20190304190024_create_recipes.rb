class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      # |Name|Cuisine|Rating|Difficulty|Instructions
      t.string :name
      t.string :cuisine
      t.integer :rating
      t.string :difficulty
      t.text :description
      t.timestamps
    end
  end
end
