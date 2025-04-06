class RecipesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(processed_recipe_params)
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

  def copy_ingredients
    @recipe = Recipe.find(params[:id])
    redirect_back(fallback_location: recipe_path(@recipe), notice: "Ingredients saved to clipboard!")
  end

  private

  def recipe_params
    params.require(:recipe).permit(
      :title,
      :ingredients,
      :description,
      :cook_time,
      :method,
      :cuisine_type,
      :utensils,
      :dietary_restrictions,
      :recipe_hashtags,
      :image,
      :video_link
    )
  end

  def processed_recipe_params
    raw = recipe_params.dup
    raw[:ingredients] = raw[:ingredients].split(';').map(&:strip) if raw[:ingredients].present?
    raw[:method] = raw[:method].split(';').map(&:strip) if raw[:method].present?
    raw[:recipe_hashtags] = raw[:recipe_hashtags].split(';').map(&:strip) if raw[:recipe_hashtags].present?
    raw
  end
end
