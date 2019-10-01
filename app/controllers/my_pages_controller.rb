class MyPagesController < ApplicationController
	def show
		@beans = Bean.find_by(user_id: params[:id])
		@recipes = Recipe.find_by(bean_id: @beans.id)
  end
end
