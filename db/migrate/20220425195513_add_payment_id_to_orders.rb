class AddPaymentIdToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :payment_id, :string
    add_column :orders, :status, :string, default: "unpaid"
  end
end
