class ChangeRecipeHashtagsInRecipes < ActiveRecord::Migration[7.1]
  def change
    # Drop the column completely
    remove_column :recipes, :recipe_hashtags

    # Add it back with explicit PostgreSQL array syntax
    execute "ALTER TABLE recipes ADD COLUMN recipe_hashtags varchar[] DEFAULT '{}'::varchar[]"
  end
end
