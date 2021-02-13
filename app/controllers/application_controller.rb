class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  # Overwriting the sign_oin redirect path method
  def after_sign_in_path_for(resource)
    return new_register_path
  end
end
