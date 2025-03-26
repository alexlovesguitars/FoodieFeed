class ChangeIngredientsToArrayInRecipes < ActiveRecord::Migration[7.1]
  def change
    # Drop the column completely
    remove_column :recipes, :ingredients

    # Add it back with explicit PostgreSQL array syntax
    execute "ALTER TABLE recipes ADD COLUMN ingredients varchar[] DEFAULT '{}'::varchar[]"
  end
end
