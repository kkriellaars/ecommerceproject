class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:province_id, :name, :email, :password, :tel_number, :card_number, :address)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:province_id, :name, :email, :password, :current_password, :tel_number,
               :card_number, :address)
    end
  end

  private

  def cart
    Product.find(session[:shopping_cart])
  end
end
