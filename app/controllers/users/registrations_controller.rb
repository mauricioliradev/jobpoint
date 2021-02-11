class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :email, :username, :password, :remember_me) }
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :username, :password, :password, :password_confirmation) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :username,:current_password, :password, :remember_me)}
    end
end
