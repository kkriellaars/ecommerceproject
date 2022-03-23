class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :unit_price
      t.string :on_sale
      t.integer :quantity
      t.string :description
      t.decimal :sale_price

      t.timestamps
    end
  end
end
