class BeansController < ApplicationController
  before_action :set_bean, only: [:show, :edit, :update, :destroy]

	def index
		@search_params = bean_search_params

		if @search_params.present?
			searched_params = Impression.search_impression(@search_params)
			@beans = Bean.search_bean(searched_params)
		else
			@beans = Bean.all
		end

  end

  def show; end

  def new
    @shop = Shop.find(params[:id])
    @bean = Bean.new
    @bean.build_impression
  end

  def edit
    @shop = Shop.find(@bean.shop.id)
  end

  def create
    @shop = Shop.find(params[:bean][:shop_id])
    @bean = @shop.beans.build(bean_params)
    if @bean.save
      redirect_to my_pages_show_path, notice: t('beans.flash.registered_bean')
    else
      render :new
    end
  end

  def update
    @bean.update!(bean_params)
    redirect_to my_pages_show_path, notice: t('beans.flash.edited_bean')
  rescue StandardError
    render action: 'edit'
  end

  def destroy
    @bean.destroy
    redirect_to my_pages_show_path, notice: t('beans.flash.deleted_bean')
  end

  private

  def set_bean
    @bean = Bean.find(params[:id])
  end

  def bean_params
    params.require(:bean).permit(:user_id, :shop_id, :country, :price, :area, :variety, :farm, :process, :roast, :bean_url, :bean_image,
                                 impression_attributes: [:id, :bean_id, :i_sour, :i_sweet, :i_bitter, :i_comment])
	end

	def	bean_search_params
		params.fetch(:search, {}).permit(:country, :roast, :i_sour, :i_sweet, :i_bitter)
	end
end
