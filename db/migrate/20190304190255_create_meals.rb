class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
    end
  end
end
