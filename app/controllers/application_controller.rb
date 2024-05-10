class ApplicationController < ActionController::Base
  layout :set_layout
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Redirect to admin root path after sign in
  def after_sign_in_path_for(resource)
    if current_user&.admin?
      admin_root_path
    else
      super
    end
  end

  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def set_layout
    if current_user&.admin?
      'admin'
    else
      'application'
    end
  end
end
