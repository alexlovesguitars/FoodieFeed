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
end
