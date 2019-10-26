class RecipeLikesController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    current_user.like_recipe(recipe)
    flash[:success] = 'レシピがお気に入りされました！'
    redirect_to my_pages_show_path
  end

  def destroy
    recipe = Recipe.find(params[:recipe_id])
    current_user.cancel_like_recipe(recipe)
    flash[:success] = 'レシピをお気に入りから外しました！'
    redirect_to my_pages_show_path
  end
end
