class AddVideoLinkToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :video_link, :string
  end
end
