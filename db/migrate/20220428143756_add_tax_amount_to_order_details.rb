class AddTaxAmountToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :tax_amount, :decimal
    add_column :order_details, :tax_paid, :decimal
  end
end
