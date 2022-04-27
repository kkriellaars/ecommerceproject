class OrdersController < ApplicationController
  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def new; end

  def show
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  def create
    @order = Order.new(params[:post].permit(:total_due, :order_date, :customer_id))
    @order.save!
    total = 0
    session[:shopping_cart].each do |cartitem|
      index = session[:shopping_cart].find_index(Product.find(cartitem).id.to_i)
      details = OrderDetail.create
      details.product_id = cartitem
      details.order_id = @order.id
      details.purchase_quantity = session[:cart_quantity][index]
      details.price_per_item = if Product.find(cartitem).sale_price.nil?
                                 Product.find(cartitem).unit_price
                               else
                                 Product.find(cartitem).sale_price
                               end
      total = if Product.find(cartitem).sale_price.nil?
                (session[:cart_quantity][index] * Product.find(cartitem).unit_price)
              else
                (session[:cart_quantity][index] * Product.find(cartitem).sale_price)
              end
      details.amount_due = total.round(2)
      details.save!
    end
    flash[:notice] = "Order placed successfully."
    redirect_back fallback_location: root_path and return
  end

  def order_details_params
    params.require(:order_details).permit(
      :purchase_quantity, :amount_due, :price_per_item
    )
  end
end
