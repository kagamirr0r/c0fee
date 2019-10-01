class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
  end

	def show
		@recipe = Recipe.find_by(id: params[:id])
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
