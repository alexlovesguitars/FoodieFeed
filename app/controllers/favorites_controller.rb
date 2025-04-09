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
    @favorite = current_user.favorites.new(recipe: @recipe)

    @favorites = current_user.favorites

    if @favorite.save
      respond_to do |format|
        flash.now[:notice] = "The recipe has been saved to your cookbook."
        format.turbo_stream do
          if request.referer&.include?(favorites_path) # from cookbook
            turbo_streams = [
              turbo_stream.append("recipe-cards", partial: "shared/card", locals: { recipe: @recipe }),
              turbo_stream.update("modal-icon-#{@recipe.id}", partial: "favorites/favorite_delete",
                                                              locals: { recipe: @recipe })
            ]
            if @favorites.count == 1 # Oly replace if this is the first favorite being added
              turbo_streams << turbo_stream.remove("empty-cookbook")
            end
            render turbo_stream: turbo_streams
            format.html { redirect_to recipes_path, notice: "The recipe has been removed." }
          end
        end
        format.html { redirect_to @favorite }
      end
    else
      flash.now[:alert] = "Something went wrong. Please try again."
    end
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @recipe = @favorite.recipe
    @favorite_recipes = current_user.favorite_recipes

    if @favorite.destroy
      flash.now[:notice] = "The recipe has been removed."
      respond_to do |format|
        format.turbo_stream do
          if request.referer&.include?(favorites_path) # from cookbook
            turbo_streams = [
              turbo_stream.update("modal-icon-#{@recipe.id}", partial: "favorites/favorite_create",
                                                              locals: { recipe: @recipe }),
              turbo_stream.remove("recipe_card_#{@recipe.id}"),
              turbo_stream.remove("note_section_#{@recipe.id}")
            ]
            if @favorite_recipes.empty?
              turbo_streams << turbo_stream.update("cookbook", partial: "favorites/empty_cookbook",
                                                               locals: { favorite_recipes: @favorite_recipes })
            end
            render turbo_stream: turbo_streams
            format.html { redirect_to recipes_path, notice: "The recipe has been removed." }
          end
        end
      end
    else
      flash.now[:alert] = "Something went wrong. Please try again."
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove("favorite_icon_#{@recipe.id}") }
        format.html { redirect_to recipes_path, alert: "Something went wrong. Please try again." }
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
