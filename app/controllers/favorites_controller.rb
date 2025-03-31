class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_recipe, only: [:create]
  before_action :set_favorite, only: [:destroy]


  def index
    @favorite_recipes = current_user.favorite_recipes
  end

  def create
    # Find the recipe
    @recipe = Recipe.find(params[:recipe_id])

    # Create a new favorite
    favorite = current_user.favorites.new(recipe: @recipe)

    if favorite.save
      redirect_back(fallback_location: recipes_path, notice: "Added to cookbook!")
    else
      redirect_back(fallback_location: recipes_path, alert: "Could not add to cookbook.")
    end
  end

  def destroy
    # Find the favorite
    @favorite = current_user.favorites.find(params[:id])

    # Delete it
    @favorite.destroy

    # Redirect back
    redirect_back(fallback_location: recipes_path, notice: "Recipe removed from cookbook!")
  rescue
    redirect_back(fallback_location: recipes_path, alert: "Could not remove from cookbook.")
  end

  private

  def set_user
    @user = current_user
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_favorite
    @favorite = Favorite.find_by(user: @user, recipe: @recipe)
  end
end
