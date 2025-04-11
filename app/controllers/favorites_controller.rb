class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_recipe, only: [:create]
  before_action :set_favorite, only: [:destroy]

  def index
    @favorite_recipes = current_user.favorite_recipes
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = current_user.favorites.new(recipe: @recipe)
    @favorites = current_user.favorites

    respond_to do |format|
      if @favorite.save
        flash[:notice] = "The recipe has been saved to your cookbook."

        format.turbo_stream do
          turbo_streams = [
            turbo_stream.update("recipe_card_#{@recipe.id}", partial: "shared/card", locals: { recipe: @recipe }),
            turbo_stream.update("modal-icon-#{@recipe.id}", partial: "favorites/favorite_delete", locals: { recipe: @recipe }),
            turbo_stream.update("flash-messages", partial: "shared/flashes")
          ]

          if @favorites.count == 1
            turbo_streams << turbo_stream.remove("empty-cookbook")
          end

          render turbo_stream: turbo_streams
        end

        format.html { redirect_to recipes_path, notice: "The recipe has been saved to your cookbook." }
      else
        flash[:alert] = "Something went wrong."

        format.turbo_stream do
          render turbo_stream: turbo_stream.update("flash-messages", partial: "shared/flashes")
        end

        format.html { redirect_to recipes_path, alert: "Something went wrong." }
      end
    end
  end


  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @recipe = @favorite.recipe
    @favorite_recipes = current_user.favorite_recipes

    respond_to do |format|
      if @favorite.destroy
        flash[:notice] = "The recipe has been removed."

        format.turbo_stream do
          turbo_streams = []

          if request.referer&.include?(favorites_path)
            # If we're on the favorites (cookbook) page, remove the card
            turbo_streams += [
              turbo_stream.remove("note_container_#{@recipe.id}"),
              turbo_stream.update("modal-icon-#{@recipe.id}", partial: "favorites/favorite_create", locals: { recipe: @recipe }),
              turbo_stream.update("flash-messages", partial: "shared/flashes")
            ]

            if @favorite_recipes.empty?
              turbo_streams << turbo_stream.update("cookbook", partial: "favorites/empty_cookbook", locals: { favorite_recipes: @favorite_recipes })
            end
          else
            turbo_streams += [
              turbo_stream.update("recipe_card_#{@recipe.id}", partial: "shared/card", locals: { recipe: @recipe }),
              turbo_stream.update("modal-icon-#{@recipe.id}", partial: "favorites/favorite_create", locals: { recipe: @recipe }),
              turbo_stream.update("flash-messages", partial: "shared/flashes")
            ]
          end

          render turbo_stream: turbo_streams
        end

        format.html { redirect_to recipes_path, notice: "The recipe has been removed." }
      else
        flash[:alert] = "Something went wrong."

        format.turbo_stream do
          render turbo_stream: turbo_stream.update("flash-messages", partial: "shared/flashes")
        end

        format.html { redirect_to recipes_path, alert: "Something went wrong." }
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
