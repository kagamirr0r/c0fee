class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
      @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))

      if @user.persisted?
          sign_in_and_redirect @user
      else
          session["devise.user_attributes"] = @user_attributes
          redirect_to new_user_registaration_url
      end
  end

end
