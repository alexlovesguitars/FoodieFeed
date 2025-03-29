class ReviewsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to recipe_path(@recipe), notice: "Thanks for your review!"
    else
      redirect_to recipe_path(@recipe), alert: "Something went wrong."
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

end
