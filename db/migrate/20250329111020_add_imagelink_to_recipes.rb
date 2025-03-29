class AddImagelinkToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :image_link, :string
  end
end
