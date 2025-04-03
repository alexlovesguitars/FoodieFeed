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

    @favorites = current_user.favorites
    duplicate = @favorites.find_by(recipe: @recipe)

    if duplicate
      redirect_back(fallback_location: recipes_path, alert: "Already in your cookbook.")
    else
      favorite.save
      respond_to do |format|
        flash.now[:notice] = "The recipe has been saved to your cookbook."
        format.turbo_stream
        format.html {redirect_to @favorite}
      end
    end
  end

  def destroy
    # Find the favorite
    @favorite = current_user.favorites.find(params[:id])

    # Delete it

    # Redirect back
    if @favorite
      @favorite.destroy
      flash.now[:notice] = "The recipe has been removed from your cookbook."
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @favorite }
      end
    else
      flash.now[:notice] = "The recipe has been removed from your cookbook."
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove("favorite_icon_#{@favorite.id}")}
        format.html {redirect_to @favorite}
      end
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
