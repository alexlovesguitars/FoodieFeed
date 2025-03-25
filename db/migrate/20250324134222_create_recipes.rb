class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title, presence: true
      t.text :ingredients, presence: true
      t.string :description, presence: true
      t.text :method, presence: true
      t.string :cuisine_type
      t.string :utensils
      t.string :dietary_restrictions
      t.string :recipe_hashtags
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
