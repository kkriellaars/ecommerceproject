class CartController < ApplicationController
  def create
    logger.debug("adding #{params[:id]} to cart")
    id = params[:id].to_i
    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id
      product = Product.find(id)
      flash[:notice] = "#{product.name} added to cart."
    end
    redirect_to root_path
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    product = Product.find(id)
    flash[:notice] = "#{product.name} removed from cart."
    redirect_to root_path
  end
end
