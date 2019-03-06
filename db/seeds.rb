Recipe.delete_all
Ingredient.delete_all
Measurement.delete_all

recipe1 = Recipe.create(name: Faker::Food.dish.downcase, cuisine: Faker::Nation.nationality.downcase, rating: rand(1..5), difficulty: "easy", description: Faker::Food.description)

recipe2 = Recipe.create(name: Faker::Food.dish.downcase, cuisine: Faker::Nation.nationality.downcase, rating: rand(1..5), difficulty: "easy", description: Faker::Food.description)

recipe3 = Recipe.create(name: Faker::Food.dish.downcase, cuisine: Faker::Nation.nationality.downcase, rating: rand(1..5), difficulty: "easy", description: Faker::Food.description)

recipe4 = Recipe.create(name: Faker::Food.dish.downcase, cuisine: Faker::Nation.nationality.downcase, rating: rand(1..5), difficulty: "medium", description: Faker::Food.description)

recipe5 = Recipe.create(name: Faker::Food.dish.downcase, cuisine: Faker::Nation.nationality.downcase, rating: rand(1..5), difficulty: "hard", description: Faker::Food.description)

ingredient1 = Ingredient.find_or_create_by(name: Faker::Food.ingredient.downcase, price: rand(0.1..25.2))
ingredient2 = Ingredient.find_or_create_by(name: Faker::Food.ingredient.downcase, price: rand(0.1..25.2))
ingredient3 = Ingredient.find_or_create_by(name: Faker::Food.ingredient.downcase, price: rand(0.1..25.2))
ingredient4 = Ingredient.find_or_create_by(name: Faker::Food.ingredient.downcase, price: rand(0.1..25.2))
ingredient5 = Ingredient.find_or_create_by(name: Faker::Food.ingredient.downcase, price: rand(0.1..25.2))

measurement1 = Measurement.create(recipe_id: recipe1.id, ingredient_id: ingredient1.id)
measurement2 = Measurement.create(recipe_id: recipe1.id, ingredient_id: ingredient2.id)
measurement3 = Measurement.create(recipe_id: recipe1.id, ingredient_id: ingredient3.id)
measurement4 = Measurement.create(recipe_id: recipe2.id, ingredient_id: ingredient3.id)
measurement5 = Measurement.create(recipe_id: recipe2.id, ingredient_id: ingredient4.id)
measurement6 = Measurement.create(recipe_id: recipe2.id, ingredient_id: ingredient5.id)
measurement7 = Measurement.create(recipe_id: recipe3.id, ingredient_id: ingredient2.id)
measurement8 = Measurement.create(recipe_id: recipe3.id, ingredient_id: ingredient1.id)
measurement9 = Measurement.create(recipe_id: recipe3.id, ingredient_id: ingredient5.id)
measurement10 = Measurement.create(recipe_id: recipe4.id, ingredient_id: ingredient1.id)
measurement11 = Measurement.create(recipe_id: recipe4.id, ingredient_id: ingredient2.id)
measurement12 = Measurement.create(recipe_id: recipe4.id, ingredient_id: ingredient3.id)
measurement10 = Measurement.create(recipe_id: recipe5.id, ingredient_id: ingredient4.id)
measurement11 = Measurement.create(recipe_id: recipe5.id, ingredient_id: ingredient5.id)
measurement12 = Measurement.create(recipe_id: recipe5.id, ingredient_id: ingredient1.id)
