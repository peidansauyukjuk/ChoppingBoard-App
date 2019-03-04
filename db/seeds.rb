Recipe.delete_all
Ingredient.delete_all
Meal.delete_all

recipe1 = Recipe.create(name: Faker::Food.dish, cuisine: Faker::Nation.nationality, rating: rand(1..5), difficulty: "easy", instructions: Faker::Food.description)

recipe2 = Recipe.create(name: Faker::Food.dish, cuisine: Faker::Nation.nationality, rating: rand(1..5), difficulty: "easy", instructions: Faker::Food.description)

recipe3 = Recipe.create(name: Faker::Food.dish, cuisine: Faker::Nation.nationality, rating: rand(1..5), difficulty: "easy", instructions: Faker::Food.description)

recipe4 = Recipe.create(name: Faker::Food.dish, cuisine: Faker::Nation.nationality, rating: rand(1..5), difficulty: "easy", instructions: Faker::Food.description)

recipe5 = Recipe.create(name: Faker::Food.dish, cuisine: Faker::Nation.nationality, rating: rand(1..5), difficulty: "easy", instructions: Faker::Food.description)

ingredient1 = Ingredient.create(name: Faker::Food.ingredient, price: rand(0.1..25.2))
ingredient2 = Ingredient.create(name: Faker::Food.ingredient, price: rand(0.1..25.2))
ingredient3 = Ingredient.create(name: Faker::Food.ingredient, price: rand(0.1..25.2))
ingredient4 = Ingredient.create(name: Faker::Food.ingredient, price: rand(0.1..25.2))
ingredient5 = Ingredient.create(name: Faker::Food.ingredient, price: rand(0.1..25.2))

meal1 = Meal.create(recipe_id: 1, ingredient_id: 1)
meal2 = Meal.create(recipe_id: 1, ingredient_id: 2)
meal3 = Meal.create(recipe_id: 1, ingredient_id: 3)
meal4 = Meal.create(recipe_id: 2, ingredient_id: 1)
meal5 = Meal.create(recipe_id: 2, ingredient_id: 4)
meal6 = Meal.create(recipe_id: 2, ingredient_id: 5)
meal7 = Meal.create(recipe_id: 3, ingredient_id: 2)
meal8 = Meal.create(recipe_id: 3, ingredient_id: 3)
meal9 = Meal.create(recipe_id: 3, ingredient_id: 4)
meal10 = Meal.create(recipe_id: 4, ingredient_id: 5)
meal11 = Meal.create(recipe_id: 4, ingredient_id: 2)
meal12 = Meal.create(recipe_id: 4, ingredient_id: 1)
