class RemoveLinkFromRecipes < ActiveRecord::Migration[7.1]
  def change
    remove_column :recipes, :link, :string
  end
end
