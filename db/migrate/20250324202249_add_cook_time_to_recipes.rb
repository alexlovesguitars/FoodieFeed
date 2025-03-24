class AddCookTimeToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :cook_time, :integer
  end
end
