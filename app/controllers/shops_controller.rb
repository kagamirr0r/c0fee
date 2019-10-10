class ShopsController < ApplicationController
	def index
		@shops = Shop.all
		flash[:choice] = "Which Shop did you buy beans?"
	end

  def show
    @shop = Shop.find_by(id: params[:id])
    @bean = Bean.find_by(shop_id: params[:id])
  end

	def new
		@shop = Shop.new
	end

  def edit; end

	def create
		@shop = Shop.new(shop_params)
		@shop.save!
		redirect_to shops_path, notice: '新規作成しました'
	rescue
		render :new
	end

  def update; end

	def destroy; end

	private
	def shop_params
		params.require(:shop).permit(:name,:address,:url,:shop_image)
	end
end
