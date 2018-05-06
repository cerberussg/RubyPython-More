module DeviseWhitelist
  extend ActiveSupport::Concern

  # Fires only if Devise is calling the app controller
  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  # Include the name param for sign_up and account_update
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
