class SessionsController < Devise::SessionsController
  def create
    super
    flash.delete(:notice)
  end

  def destroy
    super
    flash.delete(:notice)
  end

  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path
  end
end
