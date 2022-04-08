class CartController < ApplicationController
  def create
    logger.debug("adding #{params[:id]} to cart")
  end

  def destroy; end
end
