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
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def cookmode
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :description, :cook_time, :method, :cuisine_type, :utensils, :dietary_restrictions, :recipe_hashtags, :image, :video_link)
  end
end
