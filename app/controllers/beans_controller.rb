class BeansController < ApplicationController
	def index
		@beans = Bean.all
  end

	def show
		@bean = Bean.find_by(id: params[:id])
  end

	def new
		@shop = Shop.find_by(id: params[:id])
		@bean = @shop.beans.build
		@bean.build_impression
  end

  def edit
  end

	def create
		@shop = Shop.find_by(id: params[:bean][:shop_id])
		@bean = @shop.beans.build(bean_params)
		@bean.save!
		redirect_to beans_path, notice: '新規作成しました'
	rescue
   	render :new
  end

  def update
  end

  def destroy
	end

	def bean_params
		params.require(:bean).permit(:user_id, :shop_id, :country, :price, :area, :variety, :farm, :process, :roast,:bean_url,
		impression_attributes:[:id,:bean_id,:i_sour,:i_sweet,:i_bitter,:i_comment,:i_image]
		)
	end
end
