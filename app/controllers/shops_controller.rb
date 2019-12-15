class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]
  def index
    @shops = Shop.all
    flash[:choose_shop] = t('shops.flash.choose_shop')
  end

  def show
    @shop = Shop.find_by(id: params[:id])
    @beans = Bean.where(shop_id: params[:id])
  end

  def new
    @shop = Shop.new
  end

  def edit; end

  def create
    @shop = Shop.new(shop_params)
    @shop.save!
    redirect_to shops_path, notice: t('shops.flash.registered_shop')
  rescue StandardError
    render :new
  end

  def update
    @shop.update!(shop_params)
    redirect_to shops_path, notice: t('shops.flash.edited_shop')
  rescue StandardError
    render action: 'edit'
  end

  def destroy
    @shop.destroy
    redirect_to shops_path, notice: t('shops.flash.deleted_shop')
  end

  private

  def set_shop
    @shop = Shop.find_by(id: params[:id])
  end

  def shop_params
    params.require(:shop).permit(:name, :address, :url, :shop_image)
  end
end
