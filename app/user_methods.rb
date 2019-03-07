require 'pry'
def introduction
  puts "Welcome to Chopping Board!"
  puts ""
  puts "This app will allow you to enter recipes, edit and find them for later use."
  puts "We hope you enjoy our app!"
  puts ""
end


def add_recipe
  prompt = TTY::Prompt.new
  puts "What is the title of your recipe?"
  recipe_name = gets.chomp.downcase
  if Recipe.find_by(name:recipe_name)
    return "Recipe already in the cookbook!"
  else
    puts "What type of cuisine is this recipe?"
    cuisine = gets.chomp.downcase
    rating = prompt.select("Rate this recipe", %w(1 2 3 4 5))
    difficulty = prompt.select("Select difficulty", %w(Easy Medium Hard)).downcase
    puts "Enter a simple description of the recipe."
    description = gets.chomp.downcase
    puts "Enter all the ingredients, separated by comma"
    ingredients = gets.chomp.downcase
    list_of_ingredients = ingredients.split(",")
    stripped_ingredients = list_of_ingredients.collect do |word|
      word.strip
    end
    stripped_ingredients.each do |ingredient|
      Ingredient.find_or_create_by(name:ingredient)
    end
    recipe = Recipe.create(name:recipe_name, cuisine:cuisine, rating:rating.to_i, difficulty:difficulty, description:description)
    stripped_ingredients.each do |ingredient|
      Measurement.create(recipe_id: recipe.id, ingredient_id: Ingredient.find_by(name:ingredient).id)
    end
    return "#{recipe_name} added to the cookbook!".capitalize
  end
end

def find_recipe
  print "Enter recipe title: "
  recipe_name = gets.chomp.downcase
  recipes = Recipe.where("name LIKE ?", "%#{recipe_name}%").limit(5)
  if recipes == []
    puts "Sorry! That recipe is not in the cookbook."
    puts ""
  else
    recipe_array = recipes.collect{|recipe| recipe.name}
    prompt = TTY::Prompt.new
    recipe_selection = prompt.select("Which recipe would you like to see?", recipe_array)
    recipe = Recipe.find_by(name: recipe_selection)
    puts "Name: #{recipe.name.capitalize}"
    puts "Cuisine: #{recipe.cuisine.capitalize}"
    puts "Rating: #{recipe.rating}"
    puts "Difficulty: #{recipe.difficulty.capitalize}"
    puts "Description: #{recipe.description.capitalize}"
    ingredient = []
    recipe.ingredients.each do |ingredient_inst|
      ingredient << ingredient_inst.name.capitalize
    end
    ingredient = ingredient.join(", ")
    puts "Ingredients: #{ingredient}"
    return recipe
  end
end

def update_recipe
  recipe = find_recipe
  prompt = TTY::Prompt.new
  answer = prompt.select("What would you like to update?", %w(Title Cuisine Rating Difficulty Description))
  if answer == "Title"
    puts "What would you like to change the title to?"
    new_title = gets.chomp
    recipe.name = new_title.downcase
  elsif answer == "Cuisine"
    puts "What would like to change the cuisine to?"
    new_cuisine = gets.chomp
    recipe.cuisine = new_cuisine.downcase
  elsif answer == "Rating"
    new_rating = prompt.select("Rate this recipe", %w(1 2 3 4 5))
    recipe.rating = new_rating.to_i
  elsif answer == "Difficulty"
    new_difficulty = prompt.select("Select difficulty", %w(Easy Medium Hard))
    recipe.difficulty = new_difficulty.downcase
  elsif answer == "Description"
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
  puts "What ingredient would you like to add a price for?"
  ingredient_name = gets.chomp.downcase
  ingredient = Ingredient.find_or_create_by(name:ingredient_name)
  puts "How much does this cost?"
  cost = gets.chomp.downcase.to_f
  ingredient.price = cost
  ingredient.save
  "Price updated!"
end

def delete_recipe

  recipe = find_recipe
  puts "Are you sure you would like to delete this recipe? Enter Y or N"
  answer = gets.chomp.downcase.upcase
  if answer == "Y"
    Measurement.where(recipe_id: recipe.id).destroy_all
    recipe.destroy
    return "Recipe deleted from the cookbook."
  elsif answer == "N"
    return "Recipe still in the cookbook."
  else
    return "Not a valid option. Try again."
  end
end

def filter_by
  prompt = TTY::Prompt.new
  filter_choice = prompt.select("Would you like to filter by rating or difficulty?", %w(Rating Difficulty))
  if filter_choice == "Rating"
    rating_num = prompt.select("What food rating?", %w(1 2 3 4 5)).to_i
    ary = Recipe.where("rating = ?", rating_num).limit(10).map {|recipe| recipe.name }
    ary.map do |food|
      puts food.capitalize
      puts "---"
    end
  else
    difficult = prompt.select("What level of difficulty?", %w(Easy Medium Hard)).downcase
    ary = Recipe.where(difficulty: difficult).limit(10).map {|recipe| recipe.name }
    ary.map do |food|
      puts food.capitalize
      puts "---"
    end
  end
end

def find_recipe_by_ingredient
  print("What ingredients do you have? Separate by comma: ")
  user_food = gets.chomp.split(",").collect do |word|
    word.strip.downcase
  end
  ingredient_ids = user_food.collect do |ingredient|
      Ingredient.find_or_create_by(name: ingredient).id
  end
  measurement_arr = Measurement.all.select do |measurement|
    ingredient_ids.include?(measurement.ingredient_id)
  end
  hash = {}
  measurement_arr.each do |measurement|
    if hash.keys.include?(measurement.recipe_id)
      hash[measurement.recipe_id] += 1
    else
      hash[measurement.recipe_id] = 1
    end
  end
  arr = []
  hash.each do |recipe_id, ingredient_count|
    total_ingredients = Recipe.find(recipe_id).ingredients.size.to_f
    if ingredient_count / total_ingredients >= 0.50
      arr << Recipe.find(recipe_id).name
    end
  end
  if arr.empty?
    return "Sorry, you need more ingredients."
  else
    return arr.map do |food|
      puts food.capitalize
      puts "---"
    end
  end
end

def show_all_recipes
  i = 1
  Recipe.all.each do |recipe|
    puts "#{i}. #{recipe.name}"
    i += 1
  end
end

def runner
  introduction
  while true
    sleep(1)
    puts ""
    prompt = TTY::Prompt.new
    choices = [
      "Add Recipe",
      "Find Recipe",
      "See All Recipes",
      "Update Recipe",
      "Filter Recipes by Rating or Difficulty",
      "Update Ingredient Price",
      "What's in Your Fridge?",
      "Delete Recipe",
      "Exit App"
    ]
    choice = prompt.select("Select one of the following:", choices)
    case choice
    when "Add Recipe"
      puts add_recipe
    when "Find Recipe"
      find_recipe
    when "What's in Your Fridge?"
      puts find_recipe_by_ingredient
    when "Update Recipe"
      puts update_recipe
    when "Filter Recipes by Rating or Difficulty"
      filter_by
    when "See All Recipes"
      show_all_recipes
    when "Update Ingredient Price"
      puts add_price_to_ingredient
    when "Delete Recipe"
      puts delete_recipe
    when "Exit App"
      break
    end
  end
end
