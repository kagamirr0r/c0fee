class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    recipe_liked_counts(@recipe)
  end

  def new
    @bean = Bean.find_by(id: params[:id])
    @recipe = Recipe.new
    @recipe.build_taste
  end

  def edit
    @bean = Bean.find_by(id: @recipe.bean_id)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save!
    redirect_to recipes_path, notice: t('recipes.flash.created_recipe')
  rescue StandardError
    render :new
  end

  def update
    @recipe.update!(recipe_params)
    redirect_to my_pages_show_path, notice: t('recipes.flash.edited_recipe')
  rescue StandardError
    render action: 'edit'
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: t('recipes.flash.deleted_bean')
  end

  private

  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:user_id, :bean_id, :hot_ice, :grind, :temperature, :amount, :extraction, :recipe_image,
                                   taste_attributes: [:id, :recipe_id, :t_sour, :t_sweet, :t_bitter, :t_aroma, :t_fullbody, :t_comment])
  end
end
