class CartController < ApplicationController
  def create
    product = Product.find(params[:id].to_i)
    if session[:shopping_cart].include?(params[:id].to_i)
      index = session[:shopping_cart].find_index(params[:id].to_i)
      session[:cart_quantity][index] += 1
    else
      session[:shopping_cart] << params[:id].to_i
      session[:cart_quantity] << 1
    end
    flash[:notice] = "#{product.name} added to cart."
    redirect_back fallback_location: root_path
  end

  def destroy
    id = params[:id].to_i
    product = Product.find(id)
    index = session[:shopping_cart].find_index(id.to_i)
    session[:cart_quantity][index] = 0
    session[:cart_quantity].delete(index)
    session[:shopping_cart].delete(id)
    flash[:notice] =
      "#{product.name} removed from cart."
    redirect_back fallback_location: root_path
  end

  def update
    id = params[:id].to_i
    product = Product.find(id)
    index = session[:shopping_cart].find_index(id.to_i)
    session[:cart_quantity][index] -= 1
    flash[:notice] =
      "#{session[:cart_quantity][index]} #{product.name} are remaining in your cart."
    redirect_back fallback_location: root_path
  end
end
