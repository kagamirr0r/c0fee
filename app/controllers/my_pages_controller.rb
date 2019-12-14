class MyPagesController < ApplicationController
  def show
    @beans = Bean.where(user_id: current_user.id)
		@recipes = Recipe.where(user_id: current_user.id)
		@liked_beans = current_user.like_beans
		@liked_recipes = current_user.like_recipes
		@liked_shops = current_user.like_shops
  end
end
