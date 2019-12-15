class ShopLikesController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
    current_user.like_shop(shop)
    redirect_to my_pages_show_path, notice: t('shop_likes.flash.liked_shop')
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    current_user.cancel_like_shop(shop)
    redirect_to my_pages_show_path, notice: t('shop_likes.flash.canceled_shop_like')
  end
end
