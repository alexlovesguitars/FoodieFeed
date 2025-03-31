class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_recipe, only: [:create, :destroy]
  before_action :set_favorite, only: [:destroy]

  def index
    @favorite_recipes = current_user.favorite_recipes
  end

  def create
    current_user.favorites.create(recipe: @recipe)
    redirect_to recipes_path, notice: "Added to cookbook!"
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    if @favorite
      @favorite.destroy
      redirect_to request.referer || recipes_path, notice: "Recipe removed from cookbook!"
    else
      redirect_to recipes_path, alert: "Cookbook not found."
    end
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
