class RecipeLikesController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.like_recipe(recipe)
    redirect_to my_pages_show_path, notice: t('recipe_likes.flash.liked_recipe')
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    current_user.cancel_like_recipe(recipe)
    redirect_to my_pages_show_path, notice: t('recipe_likes.flash.canceled_recipe_like')
  end
end
