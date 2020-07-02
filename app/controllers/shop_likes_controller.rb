class ShopLikesController < ApplicationController
  def create
    @shop = Shop.find(params[:id])
    current_user.like_shop(@shop)
  end

  def destroy
    @shop = Shop.find(params[:id])
    current_user.cancel_like_shop(@shop)
  end
end
