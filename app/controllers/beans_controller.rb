class BeansController < ApplicationController
	def index
		@beans = Bean.all
  end

	def show
		@bean = Bean.find_by(id: params[:id])
  end

	def new
		@shop = Shop.new
		@shop.beans.build
		@bean = current_user.beans.build
		@bean.build_impression
  end

  def edit
  end

	def create
		@bean = current_user.beans.build(bean_params)
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
		params.require(:bean).permit(:user_id, :shop_id, :country, :price, :area, :variety, :farm, :process, :roast)
	end
end
