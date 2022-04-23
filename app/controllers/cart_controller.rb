class CartController < ApplicationController
  def create
    logger.debug("adding #{params[:id]} to cart")
    id = params[:id].to_i
    product = Product.find(id)
    if session[:shopping_cart].include?(id)
      index = session[:shopping_cart].find_index(id.to_i)
      session[:cart_quantity][index] += 1
      flash[:notice] =
        "A total of #{session[:cart_quantity][index]} #{product.name} are in your cart."
    else
      session[:shopping_cart] << id
      session[:cart_quantity] << 1
      flash[:notice] = "#{product.name} added to cart."
    end
    redirect_back fallback_location: root_path
  end

  def destroy
    id = params[:id].to_i
    product = Product.find(id)
    session[:shopping_cart].delete(id)
    index = session[:shopping_cart].find_index(id.to_i)
    session[:cart_quantity][index] = 0
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
