class CookbooksController < ApplicationController
  before_action :set_user
  before_action :set_recipe, only: [:create, :destroy]
  before_action :set_cookbook, only: [:destroy]

  def new
    # will be triggered by like function in recipe
  end

  def create
    @cookbook = Cookbook.new(cookbook_params)
    @cookbook.recipe = @recipe
    if @cookbook.recipe.like
      @cookbook.save
      redirect_to cookbook_path(@pcookbook.user), notice: "You saved this recipe in your cookbook!"
    else
      render "recipes/show", status: :unprocessable_entity
    end
  end

  def destroy
    @cookbook.recipe.destroy
  end

  def show
    @cookbooks = @user.cookbooks
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_cookbook
    @cookbook = Cookbook.find_by(user: @user, recipe: @recipe)
  end

  def cookbook_params
    params.permit(:notes)
  end
end
