class UsersController < ApplicationController
  before_action :find_user,  only: [:show]

  def index
    @users = User.all
  end

  def show
    unless @user.creator?
      redirect_to root_path, alert: "This user does not have a creator page."
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
    begin
      Integer(params[:user_name])
      @user = User.find(params[:user_name])
    rescue ArgumentError, TypeError
      @user = User.find_by(user_name: params[:user_name])
    end
    if @user.nil?
      redirect_to root_path, alert: "User not found."
    end
  end
end
