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
