class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
    @beans = Bean.where(user_id: @user.id).page(params[:page])
    @recipes = Recipe.where(user_id: @user.id).page(params[:page])
    @liked_beans = @user.like_beans.page(params[:page])
    @liked_recipes = @user.like_recipes.page(params[:page])
    @liked_shops = @user.like_shops.page(params[:page])
  end
end
