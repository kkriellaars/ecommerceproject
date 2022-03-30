class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.integer :purchase_quantity
      t.decimal :amount_due
      t.decimal :price_per_item
      t.timestamps
      t.references :product, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
    end
  end
end
