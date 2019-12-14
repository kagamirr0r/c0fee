class BeanLikesController < ApplicationController
  def create
    bean = Bean.find(params[:bean_id])
    current_user.like_bean(bean)
    redirect_to my_pages_show_path, notice: t('bean_likes.flash.liked_bean')
  end

  def destroy
    bean = Bean.find(params[:bean_id])
    current_user.cancel_like_bean(bean)
    redirect_to my_pages_show_path, notice: t('bean_likes.flash.canceled_like_bean')
  end
end
