class MyPagesController < ApplicationController
	def show
		@beans = Bean.where(user_id: current_user.id)

		@beans.each do |bean|
		@recipes = Recipe.where(bean_id: bean.id)
		end
  end
end
