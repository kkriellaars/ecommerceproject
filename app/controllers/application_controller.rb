class ApplicationController < ActionController::Base
  before_action :initialize_session
  helper_method :cart
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

  def initialize_session
    session[:shopping_cart] ||= []
    session[:cart_quantity] ||= []
  end

  def cart
    Product.find(session[:shopping_cart])
  end
end
