class ChangeMethodToArrayInRecipes < ActiveRecord::Migration[7.1]
  def change
    # Drop the column completely
    remove_column :recipes, :method

    # Add it back with explicit PostgreSQL array syntax
    execute "ALTER TABLE recipes ADD COLUMN method varchar[] DEFAULT '{}'::varchar[]"
  end
end
