class BeanLikesController < ApplicationController
  def create
    bean = Bean.find(params[:bean_id])
    current_user.like_bean(bean)
    flash[:success] = '豆がお気に入りされました！'
    redirect_to my_pages_show_path
  end

  def destroy
    bean = Bean.find(params[:bean_id])
    current_user.cancel_like_bean(bean)
    flash[:success] = '豆をお気に入りから外しました！'
    redirect_to my_pages_show_path
  end
end
