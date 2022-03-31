class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(5)
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
end

def product_params
  params.require(:product).permit(:name, :id, :search)
end
