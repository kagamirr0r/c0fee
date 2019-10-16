class MyPagesController < ApplicationController
  def show
    @beans = Bean.where(user_id: current_user.id)
    @recipes = Recipe.where(user_id: current_user.id)
  end
end
