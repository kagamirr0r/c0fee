class UsersController < ApplicationController

	def index
	end

	def show
		@user = User.find_by(id: params[:id])
		@beans = Bean.where(user_id: @user.id)
		@beans.each do |bean|
			@recipes = Recipe.where(bean_id: bean.id)
		end
  end
end
