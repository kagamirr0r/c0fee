class RecipeLikesController < ApplicationController
  def create
    @recipe = Recipe.find(params[:id])
    current_user.like_recipe(@recipe)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    current_user.cancel_like_recipe(@recipe)
  end
end
