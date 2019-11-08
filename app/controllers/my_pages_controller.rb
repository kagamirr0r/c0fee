class MyPagesController < ApplicationController
  def show
    @beans = Bean.where(user_id: current_user.id)
		beans_liked_counts(@beans)

		@recipes = Recipe.where(user_id: current_user.id)
		recipes_liked_counts(@recipes)

		@liked_beans = current_user.like_beans
		liked_beans_liked_counts(@liked_beans)

		@liked_recipes = current_user.like_recipes
		liked_recipes_liked_counts(@liked_recipes)

		@liked_shops = current_user.like_shops
		liked_shops_liked_counts(@liked_shops)
  end
end
