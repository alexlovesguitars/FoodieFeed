class RecipesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :description, :method, :cuisine_type, :utensils, :dietary_restrictions, :recipe_hashtags)
  end
end
