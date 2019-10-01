class ShopsController < ApplicationController
  def index
  end

	def show
		@shop = Shop.find_by(id: params[:id])
		@bean = Bean.find_by(shop_id: params[:id])
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
