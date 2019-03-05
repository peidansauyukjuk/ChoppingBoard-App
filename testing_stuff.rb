require "tty-prompt"

prompt = TTY::Prompt.new
choices = [
  "Add Recipe",
  "Find Recipe",
  "Update Recipe",
  "Update Ingredient Price",
  "Delete Recipe",
  "Exit App"
]
choice_made = prompt.select("Select one of the following:", choices)
puts choice_made

#
# puts "Select one of the following:"
# puts "1. Add Recipe"
# puts "2. Find Recipe"
# puts "3. Update Recipe"
# puts "4. Update Ingredient Price"
# puts "5. Delete Recipe"
# puts "0. Exit App"
# # puts ""
def find_recipe_by_ingredient
  print("What ingredients do you have? (Separate by comma)")
  user_food = gets.chomp

  ingredient_ids = user_food.split(",").collect do |ingredient|
      Ingredient.find_by(name: ingredient).id
  end
  meal_arr = Meals.all.select do |meal|
    ingredent_ids.include?(meal.ingredient_id)
  end
  hash = {}
  meal_arr.each do |meal|
    if hash.keys.include?(meal.recipe_id)
      hash[meal.recipe_id] += 1
    else
      hash[meal.recipe_id] = 1
    end
  end
  arr = []
  hash.each do |recipe_id, ingredient_count|
    total_ingredients.to_f = Recipe.find(recipe_id).ingredients.size
    if ingredient_count / total_ingredients > 0.80
      arr << Recipe.find(recipe_id).name
    end
  end
  return arr
end 
