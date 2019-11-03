class BeansController < ApplicationController
  before_action :set_bean, only: [:show, :edit, :update, :destroy]

  def index
		@beans = Bean.all
		flash[:choose_bean] = t('beans.flash.choose_bean')
  end

  def show
    bean_liked_counts(@bean)
  end

  def new
    @shop = Shop.find_by(id: params[:id])
    @bean = Bean.new
    @bean.build_impression
  end

  def edit
    @shop = Shop.find_by(id: @bean.shop_id)
  end

  def create
    @bean = Bean.new(bean_params)
    @bean.save!
    redirect_to beans_path, notice: t('beans.flash.registered_bean')
  rescue StandardError
    render :new
  end

  def update
    @bean.update!(bean_params)
    redirect_to beans_path, notice: t('beans.flash.edited_bean')
  rescue StandardError
    render action: 'edit'
  end

  def destroy
    @bean.destroy
    redirect_to beans_path, notice: t('beans.flash.deleted_bean')
  end

  private

  def set_bean
    @bean = Bean.find_by(id: params[:id])
  end

  def bean_params
    params.require(:bean).permit(:user_id, :shop_id, :country, :price, :area, :variety, :farm, :process, :roast, :bean_url, :bean_image,
                                 impression_attributes: [:id, :bean_id, :i_sour, :i_sweet, :i_bitter, :i_comment])
  end
end
