class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :landing ]

  def home
    @recipes = Recipe.all
  end

  def landing
  end
end
