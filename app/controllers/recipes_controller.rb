class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipe_search_params = recipe_search_params

    @recipes = if recipe_search_params.present?
                 Recipe.joins(bean: :translations).where(bean_translations: { locale: I18n.locale })
                       .search_recipe(@recipe_search_params).page(params[:page])
               else
                 Recipe.joins(bean: :translations).where(bean_translations: { locale: I18n.locale }).page(params[:page])
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
    redirect_to "/my_pages/#{current_user.id}#made_recipes", notice: t('recipes.flash.made_recipe')
  rescue StandardError
    render :new
  end

  def update
    @recipe.update!(recipe_params)
    redirect_to "/my_pages/#{current_user.id}#made_recipes", notice: t('recipes.flash.edited_recipe')
  rescue StandardError
    render action: 'edit'
  end

  def destroy
    @recipe.destroy
    redirect_to "/my_pages/#{current_user.id}#made_recipes", notice: t('recipes.flash.deleted_recipe')
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:user_id, :bean_id, :hot_ice, :grind, :temperature, :amount, :extraction, :extracted_amount, :recipe_image,
                                   taste_attributes: [:id, :recipe_id, :t_sour, :t_sweet, :t_bitter, :t_aroma, :t_fullbody, :t_comment])
  end

  def recipe_search_params
    params.fetch(:search_recipe, {}).permit(:hot_ice, :extraction, :t_sour,	:t_sweet, :t_bitter, :t_aroma, :t_fullbody)
  end
end
