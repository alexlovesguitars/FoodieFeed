class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe
  before_action :ensure_user_has_saved_recipe

  def create
    @note = @recipe.notes.new(note_params.merge(user: current_user))

    if @note.save
      respond_to do |format|
        format.html { redirect_to favorites_path, notice: "Note added!" }
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { redirect_to favorites_path(edit_recipe_id: @recipe.id), alert: "Couldn't add note." }
        format.turbo_stream
      end
    end
  end

  def update
    @note = @recipe.notes.find_by(user: current_user)

    if @note.update(note_params)
      respond_to do |format|
        format.html { redirect_to favorites_path, notice: "Note updated!" }
        format.turbo_stream
      end
    else
      redirect_to favorites_path(edit_recipe_id: @recipe.id), alert: "Couldn't update note."
    end
  end


  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def ensure_user_has_saved_recipe
    unless current_user.saved_recipe?(@recipe)
      redirect_to recipe_path(@recipe), alert: "Save this recipe before adding a note."
    end
  end
end
