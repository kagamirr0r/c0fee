class MyPagesController < ApplicationController
  def show
    @beans = Bean.where(user_id: current_user.id).page(params[:page]).per(1).order(created_at: :desc)
    @recipes = Recipe.where(user_id: current_user.id).page(params[:page]).per(1).order(created_at: :desc)
    @liked_beans = current_user.like_beans.page(params[:page]).per(1).order(created_at: :desc)
    @liked_recipes = current_user.like_recipes.page(params[:page]).per(1).order(created_at: :desc)
    @liked_shops = current_user.like_shops.page(params[:page]).per(1).order(created_at: :desc)
  end
end
