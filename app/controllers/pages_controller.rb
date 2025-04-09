class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :landing]

  def home
    @recipes = Recipe.all
  end

  def landing
    if user_signed_in?
      redirect_to home_path
    end
  end

  def search
    if params[:query].present?
      query = "%#{params[:query]}%"
      @recipes = Recipe.where(
        "title ILIKE :q OR description ILIKE :q OR cuisine_type ILIKE :q OR dietary_restrictions ILIKE :q OR recipe_hashtags::text ILIKE :q OR ingredients::text ILIKE :q",
        q: query
      )
    else
      @recipes = Recipe.none
    end
  end

end
