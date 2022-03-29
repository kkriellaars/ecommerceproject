class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.integer :purchase_quantity
      t.decimal :amount_due
      t.decimal :price_per_item

      t.timestamps
    end
  end
end
