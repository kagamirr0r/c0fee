class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(resource)
    my_page_path(current_user)
  end

  private
  def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
  end

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
    end

end
