class UsersController < ApplicationController
  before_action :find_user,  only: [:show]

  def index
    @users = User.all
  end

  def show
    unless @user.creator?
      redirect_to edit_user_registration_path, alert: "User is not yet a creator."
      return
    end
    @recipes = @user.recipes
  end

  private

  # def find_user
  #   @user = User.find(params[:id])
  #   @user = User.find_by_user_name(param[:id])
  # end

  def find_user
    user_name = params[:user_name].downcase

    begin
    Integer(user_name) # Attempt to convert to integer
    @user = User.find(user_name)
    rescue ArgumentError, TypeError
      @user = User.where('LOWER(user_name) = ?', user_name).first # Case-insensitive query
    end

    if @user.nil?
      redirect_to edit_user_registration_path, alert: "User is not yet a creator."
    end
  end
end
