class BeansController < ApplicationController
  before_action :set_bean, only: [:show, :edit, :update, :destroy]

  def index
    @bean_search_params = bean_search_params

    @beans = if @bean_search_params.present?
               Bean.with_translations(I18n.locale).search_bean(@bean_search_params).page(params[:page])
             else
               Bean.with_translations.where(bean_translations: { locale: I18n.locale }).page(params[:page])
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
      redirect_to my_page_path(current_user), notice: t('beans.flash.registered_bean')
    else
      render :new
    end
  end

  def update
    @bean.update!(bean_params)
    redirect_to my_page_path(current_user), notice: t('beans.flash.edited_bean')
  rescue StandardError
    @shop = Shop.find(@bean.shop.id)
    render action: 'edit'
  end

  def destroy
    @bean.destroy
    redirect_to my_page_path(current_user), notice: t('beans.flash.deleted_bean')
  end

  private

  def set_bean
    @bean = Bean.find(params[:id])
  end

  def bean_params
    params.require(:bean).permit(:user_id, :shop_id, :country, :price, :area, :variety, :farm, :process, :roast, :bean_image, :roast_date,
                                 impression_attributes: [:id, :bean_id, :i_sour, :i_sweet, :i_bitter, :i_comment])
  end

  def	bean_search_params
    params.fetch(:search_bean, {}).permit(:country, :roast, :i_sour, :i_sweet, :i_bitter)
  end
end
