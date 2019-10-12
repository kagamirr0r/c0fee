class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def new
    @bean = Bean.find_by(id: params[:id])
    @recipe = @bean.recipes.build
    @recipe.build_taste
  end

	def edit
	end

  def create
    @bean = Bean.find_by(id: params[:recipe][:bean_id])
    @recipe = @bean.recipes.build(recipe_params)
    @recipe.save!
    redirect_to recipes_path, notice: '新規作成しました'
  rescue StandardError
    render :new
  end

  def update
    @recipe.update!(recipe_params)
    redirect_to my_pages_show_path
  rescue StandardError
    render action: 'edit'
  end

  def destroy; end

  private

  def recipe_params
    params.require(:recipe).permit(:bean_id, :name, :grind, :temperature, :amount, :extraction, :r_image,
		taste_attributes: [:id, :recipe_id, :t_sour, :t_sweet, :t_bitter, :t_aroma, :t_fullbody, :t_comment])
  end
end
