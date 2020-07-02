class MyPagesController < ApplicationController
  def show
    @beans = Bean.where(user_id: current_user.id).page(params[:page])
    @recipes = Recipe.where(user_id: current_user.id).page(params[:page])
    @liked_beans = current_user.like_beans.page(params[:page])
    @liked_recipes = current_user.like_recipes.page(params[:page])
    @liked_shops = current_user.like_shops.page(params[:page])
  end
end
