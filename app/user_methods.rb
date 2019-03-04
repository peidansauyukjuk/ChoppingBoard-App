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
    #Check if recipe already exists, if so return "Recipe already in DB"
  #Else do following
  #Prompt user to enter recipe cuisine
  #Prompt user to enter recipe rating
  #Prompt user to enter recipe difficulty
  #Prompt user to enter recipe instructions
  #Prompt user to enter ingredient list separated by commas
  #We turn string list into an array and add indiviually to db
  #If ingredient is not in Ingredient.all then we will create it
  #Recipe.create(title: title, the rest)
end

def find_recipe
  #Prompt to enter recipe title
  #Display top 5 recipe titles if no exact matches are found.
  #Let user choose from those 5 and puts attributes
  #Return recipe instance
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
