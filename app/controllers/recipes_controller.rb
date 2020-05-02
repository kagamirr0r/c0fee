class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipe_search_params = recipe_search_params

    @recipes = if recipe_search_params.present?
                 Recipe.search_recipe(@recipe_search_params).page(params[:page]).order(created_at: :desc)
               else
                 Recipe.all.page(params[:page]).order(created_at: :desc)
               end
  end

  def show; end

  def new
    @bean = Bean.find(params[:id])
    @recipe = Recipe.new
    @recipe.build_taste
  end

  def edit
    @bean = Bean.find(@recipe.bean.id)
  end

  def create
    @bean = Bean.find(params[:recipe][:bean_id])
    @recipe = @bean.recipes.build(recipe_params)
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
    redirect_to my_pages_show_path, notice: t('recipes.flash.deleted_recipe')
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:user_id, :bean_id, :hot_ice, :grind, :temperature, :amount, :extraction, :recipe_image,
                                   taste_attributes: [:id, :recipe_id, :t_sour, :t_sweet, :t_bitter, :t_aroma, :t_fullbody, :t_comment])
  end

  def recipe_search_params
    params.fetch(:search_recipe, {}).permit(:hot_ice, :extraction, :t_sour,	:t_sweet, :t_bitter, :t_aroma, :t_fullbody)
  end
end
