class BeansController < ApplicationController
	before_action :set_bean, only: [:show,:edit,:update,:destroy]

	def index
		@beans = Bean.all
  end

	def show
  end

	def new
		@shop = Shop.find_by(id: params[:id])
		@bean = @shop.beans.build
		@bean.build_impression
  end

	def edit
		@shop = Shop.find_by(id: @bean.shop_id)
  end

	def create
		@shop = Shop.find_by(id: params[:bean][:shop_id])
		@bean = @shop.beans.build(bean_params)
		@bean.save!
		redirect_to beans_path, notice: 'Added new Bean!'
	rescue
   	render :new
  end

	def update
		@bean.update!(bean_params)
		redirect_to beans_path, notice: 'Edited Bean!'
	rescue
		render action: 'edit'
  end

  def destroy
	end

	private

	def set_bean
		@bean = Bean.find_by(id: params[:id])
	end

	def bean_params
		params.require(:bean).permit(:user_id, :shop_id, :country, :price, :area, :variety, :farm, :process, :roast,:bean_url,:bean_image,
		impression_attributes:[:id,:bean_id,:i_sour,:i_sweet,:i_bitter,:i_comment,:i_image]
		)
	end
end
