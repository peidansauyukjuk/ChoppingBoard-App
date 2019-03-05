def introduction
  puts "Welcome to the Cookbook!"
  puts "This app will allow you to enter recipes, edit and find them for later use."
  puts "We hope you enjoy!"
  puts ""
  puts ""
end
# 
# def display_choices
#   puts "Select one of the following:"
#   puts "1. Add Recipe"
#   puts "2. Find Recipe"
#   puts "3. Update Recipe"
#   puts "4. Update Ingredient Price"
#   puts "5. Delete Recipe"
#   puts "0. Exit App"
#   puts ""
# end

def add_recipe
  #Prompt user to enter recipe title
  puts "What is the title of your recipe?"
  recipe_name = gets.chomp
  if Recipe.find_by(name:recipe_name)
    return "Recipe already in the cookbook!"
  else
    puts "What type of cuisine is this recipe?"
    cuisine = gets.chomp
    puts "Rate this recipe from 1-5."
    rating = gets.chomp
    puts "Enter easy, medium, or hard."
    difficulty = gets.chomp
    puts "Enter a simple description of the recipe."
    description = gets.chomp
    puts "Enter all the ingredients, separated by comma"
    ingredients = gets.chomp
    ingredients = ingredients.scan(/\w+/)
    ingredients.each do |ingredient|
      Ingredient.find_or_create_by(name:ingredient)
    end
    recipe = Recipe.create(name:recipe_name, cuisine:cuisine, rating:rating.to_i, difficulty:difficulty, description:description)
    ingredients.each do |ingredient|
      Meal.create(recipe_id: recipe.id, ingredient_id: Ingredient.find_by(name:ingredient).id)
    end
    return "#{recipe_name} added to the cookbook!".capitalize
  end
end

def find_recipe
  #Prompt to enter recipe title
  #Display top 5 recipe titles if no exact matches are found.
  #Let user choose from those 5 and puts attributes
  #Return recipe instance
  print "Enter recipe title: "
  recipe_name = gets.chomp
  recipes = Recipe.where("name LIKE ?", "%#{recipe_name}%").limit(5)
  if recipes == []
    puts "Sorry! That recipe is not in the cookbook."
    puts ""
  else
    # i = 1
    recipe_array = recipes.collect{|recipe| recipe.name}
    prompt = TTY::Prompt.new
    recipe_selection = prompt.select("Which recipe would you like to see?", recipe_array)
    # recipes.each do |recipe|
    #   puts "#{i}. #{recipe.name}"
    #   i += 1
    # end
    # puts "Which recipe would you like to see (Enter a number):"
    # num = gets.chomp.to_i
    recipe = Recipe.find_by(name: recipe_selection)
    puts "Name: #{recipe.name.capitalize}"
    puts "Cuisine: #{recipe.cuisine.capitalize}"
    puts "Rating: #{recipe.rating}"
    puts "Difficulty: #{recipe.difficulty.capitalize}"
    puts "Description: #{recipe.description.capitalize}"
    return recipe
  end
end

def update_recipe
  # find_recipe <-- this is the recipe instance
  # Prompt user to select from attributes to update
  # Give a list of attributes to update
  # If-else statements for attribute chosen.
  # puts "Recipe updated!"
  recipe = find_recipe
  puts "What would you like to update? (Enter a number)"
  puts "1. Title\n2. Cusine\n3. Rating\n4. Difficulty\n5. Description"
  print ">"
  num = gets.chomp.to_i
  if num == 1
    puts "What would you like to change the title to?"
    new_title = gets.chomp
    recipe.name = new_title.downcase
  elsif num == 2
    puts "What would like to change the cuisine to?"
    new_cuisine = gets.chomp
    recipe.cuisine = new_cuisine.downcase
  elsif num == 3
    puts "Enter a new rating from 1 to 5:"
    new_rating = gets.chomp
    recipe.rating = new_rating.to_i
  elsif num == 4
    puts "Change difficulty to easy, medium, or hard:"
    new_difficulty = gets.chomp
    recipe.difficulty = new_difficulty.downcase
  elsif num == 5
    puts "Change description:"
    new_description = gets.chomp
    recipe.description = new_description.downcase
  else
    return "Sorry, that's not an option."
  end
  recipe.save
  return "Recipe updated!"
end

def add_price_to_ingredient #For ingredient
  # Prompt user to enter ingredient name
  # If ingredient exists, edit price
  # Otherwise Ingredient.create and also edit price.
  # "Ingredient updated!"
  puts "What ingredient would you like to add a price for?"
  ingredient_name = gets.chomp
  ingredient = Ingredient.find_or_create_by(name:ingredient_name)
  puts "How much does this cost?"
  cost = gets.chomp.to_f
  ingredient.price = cost
  ingredient.save
  "Price updated!"
end

def delete_recipe
  # find_recipe
  # Prompt user to confirm deletion
  recipe = find_recipe
  puts "Are you sure you would like to delete this recipe? Enter Y or N"
  answer = gets.chomp.upcase
  if answer == "Y"
    recipe.destroy
    return "Recipe deleted from the cookbook."
  elsif answer == "N"
    return "Recipe still in the cookbook."
  else
    return "Not a valid option. Try again."
  end
end

def runner
  introduction
  while true
    sleep(2)
    puts ""
    prompt = TTY::Prompt.new
    choices = [
      "Add Recipe",
      "Find Recipe",
      "Update Recipe",
      "Update Ingredient Price",
      "Delete Recipe",
      "Exit App"
    ]
    choice = prompt.select("Select one of the following:", choices)
    case choice
    when "Add Recipe"
      puts add_recipe
    when "Find Recipe"
      find_recipe
    when "Update Recipe"
      puts update_recipe
    when "Update Ingredient Price"
      puts add_price_to_ingredient
    when "Delete Recipe"
      puts delete_recipe
    when "Exit App"
      break
    end
  end
end
