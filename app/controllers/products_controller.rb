class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def sale
    @products = Product.all
  end

  def new
    @products = Product.all
  end
end
