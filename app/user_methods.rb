def introduction
  puts "Welcome to the Cookbook"
end

def select_choices
  puts "Select one of the following:"
  puts "1. Add Recipe"
  puts "2. Add Ingredient"
  puts "3. Find Recipe"
  puts "4. Find Ingredient"
  puts "5. Update Recipe"
  puts "6. Update Ingredient"
  puts "7. Delete Recipe"
  puts "8. Delete Ingredient"
  puts "0. Exit App"
end

def add_recipe
  #Prompt user to enter recipe title
  recipe_name = gets.chomp("What is the title of your recipe?")
  if Recipe.find_by(name:recipe_title)
    return "Recipe already in the cookbook!"
  else
    cuisine = gets.chomp("What type of cuisine is this recipe?")
    rating = gets.chomp("Rate this recipe from 1-5.")
    difficulty = gets.chomp("Enter easy, medium, or hard.")
    descriptions = gets.chomp("Enter a simple description of the recipe.")
    ingredients = gets.chomp("Enter all the ingredients, separated by comma")
    ingredients = ingredients.split(",")
    ingredients.each do |ingredient|
      Ingredient.find_or_create_by(name:ingredient)
    end
    recipe = Recipe.create(name:recipe_name, cuisine:cuisine, rating:rating, difficulty:difficult, descriptions:descriptions)
    ingredients.each do |ingredient|
      Meal.create(recipe_id: recipe.id, ingredient_id: Ingredient.find_by(name:ingredient).id)
    end
    return "#{recipe_name} added to the cookbook!"
  end
end

def find_recipe
  #Prompt to enter recipe title
  #Display top 5 recipe titles if no exact matches are found.
  #Let user choose from those 5 and puts attributes
  #Return recipe instance
  recipe_name = gets.chomp("Enter recipe title:")
  recipes = Recipe.where("name LIKE ?", "%#{recipe_name}%").limit(5)
  i = 1
  recipes.each do |recipe|
    puts "i. #{recipe.name}"
    i += 1
  end
  num = gets.chomp("Enter the number corresponding to the recipe:")
  recipe = recipes[num - 1]
  puts "Name: #{recipe.name}"
  puts "Cuisine: #{recipe.cusine}"
  puts "Rating: #{recipe.rating}"
  puts "Difficulty: #{recipe.difficulty}"
  puts "Description: #{recipe.descriptions}"
  recipe
end

# def find_ingredient
#   #Prompt to enter recipe title
#   #Display top 5 recipe titles if no exact matches are found.
#   #Let user choose from those 5 and display attributes
# end

def update_recipe
  # find_recipe <-- this is the recipe instance
  # Prompt user to select from attributes to update
  # Give a list of attributes to update
  # If-else statements for attribute chosen.
  # puts "Recipe updated!"
  recipe = find_recipe
  
end

def add_price #For ingredient
  # Prompt user to enter ingredient name
  # If ingredient exists, edit price
  # Otherwise Ingredient.create and also edit price.
  # "Ingredient updated!"
end

def delete_recipe
  # find_recipe
  # Prompt user to confirm deletion
end
