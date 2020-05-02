class TopPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @beans = Bean.page(params[:page]).order(created_at: :desc).limit(5)
    @recipes = Recipe.page(params[:page]).order(created_at: :desc).limit(5)
    @shops = Shop.page(params[:page]).order(created_at: :desc).limit(5)
  end
end
