class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find_by(id: params[:id])
    @beans = Bean.where(user_id: @user.id)
    @recipes = Recipe.where(user_id: @user.id)
  end
end
