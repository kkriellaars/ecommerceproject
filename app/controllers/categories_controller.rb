class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @producttype = Product.where("products.category_id = ?", params[:id]).page(params[:page]).per(5)
  end
end
