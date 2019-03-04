class ChangeRecipeColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :recipes, :instructions, :descriptions
  end
end
