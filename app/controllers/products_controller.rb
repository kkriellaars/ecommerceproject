class ProductsController < ApplicationController
  def index
    @products = Product.search(params[:search], params[:search_category]).page(params[:page]).per(5)
    @categories = Category.all
  end

  def sale
    @productsale = Product.where(on_sale: "Y").page(params[:page]).per(5)
  end

  def new
    @productsnew = Product.where("created_at >= ?", 3.days.ago).page(params[:page]).per(5)
  end

  def updated
    @productsupdated = Product.where("updated_at >= ?", 3.days.ago).page(params[:page]).per(5)
  end

  def show
    @singleproduct = Product.find(params[:id])
  end
end

def product_params
  params.require(:product).permit(:name, :id, :description, :search, :category_id)
end
