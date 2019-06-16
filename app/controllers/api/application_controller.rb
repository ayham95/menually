class Api::ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::RequestForgeryProtection

  protect_from_forgery prepend: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_business!

  protected
  def configure_permitted_parameters
    added_attrs = [:managerPhone, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def provider
    'phone'
  end


end
