class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.find_for_google_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, :kind => "Google")
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_path
    end
  end
end
