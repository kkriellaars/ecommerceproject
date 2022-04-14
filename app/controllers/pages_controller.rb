class PagesController < ApplicationController
  def product_params
    params.require(:products).permit(:name, :category_id, :id, :search)
  end
end
