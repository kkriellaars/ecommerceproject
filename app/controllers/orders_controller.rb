class OrdersController < ApplicationController
  def index; end

  def new; end

  def create
    @order = Order.new(params[:post].permit(:total_due, :order_date, :customer_id))
    @order.save!
    session[:shopping_cart].each do |cartitem|
      index = session[:shopping_cart].find_index(Product.find(cartitem).id.to_i)
      details = Order_detail.new
      details.product_id = cartitem
      details.order_id = @order.id
      details.purchase_quantity = session[:cart_quantity][index]
      details.price_per_item = if !Product.find(cartitem).sale_price.nil?
                                 Product.find(cartitem).unit_price
                               else
                                 Product.find(cartitem).sale_price
                               end
      details.amount_due =
        details.save!
    end
  end

  def order_details_params
    params.require(:order_details).permit(
      :purchase_quantity, :amount_due, :price_per_item
    )
  end
end
