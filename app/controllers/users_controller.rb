class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find_by(id: params[:id]).page(params[:page]).per(1).order(created_at: :desc)
    @beans = Bean.where(user_id: @user.id).page(params[:page]).per(1).order(created_at: :desc)
    @recipes = Recipe.where(user_id: @user.id).page(params[:page]).per(1).order(created_at: :desc)
    @liked_beans = @user.like_beans.page(params[:page]).per(1).order(created_at: :desc)
    @liked_recipes = @user.like_recipes.page(params[:page]).per(1).order(created_at: :desc)
    @liked_shops = @user.like_shops.page(params[:page]).per(1).order(created_at: :desc)
  end
end
