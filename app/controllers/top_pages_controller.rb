class TopPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @beans = Bean.limit(10).page(params[:page])
    @recipes = Recipe.limit(10).page(params[:page])
    @shops = Shop.limit(10).page(params[:page])
  end
end
