class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :introduce, :prefecture_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :introduce, :prefecture_id])
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
