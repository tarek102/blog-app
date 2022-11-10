class ApplicationController < ActionController::Base
  # def current_user
  #   User.first
  # end
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password, :bio, :photo) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :email, :password, :current_password, :bio, :photo)
    end
  end
end
