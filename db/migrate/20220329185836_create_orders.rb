class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.decimal :total_due

      t.timestamps
      t.references :customer, null: false, foreign_key: true
    end
  end
end
