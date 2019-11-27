class TopPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
		@beans = Bean.last(3)
		@recipes = Recipe.last(3)
    @shops = Shop.last(3)
  end
end
