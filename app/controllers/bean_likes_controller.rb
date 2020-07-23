class BeanLikesController < ApplicationController
  def create
    @bean = Bean.find(params[:id])
    current_user.like_bean(@bean)
  end

  def destroy
    @bean = Bean.find(params[:id])
    current_user.cancel_like_bean(@bean)
  end
end
