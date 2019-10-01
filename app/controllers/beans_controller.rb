class BeansController < ApplicationController
	def index
		@beans = Bean.all
  end

	def show
		@bean = Bean.find_by(id: params[:id])
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

	def bean_params
		params.require(:bean).permit(:user_id, :shop_id, :country, :price, :area, :variety, :farm, :process, :roast)
	end
end
