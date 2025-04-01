class AddVideoLinkToRecipes < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:recipes, :video_link)
      add_column :recipes, :video_link, :string
    end
  end
end
