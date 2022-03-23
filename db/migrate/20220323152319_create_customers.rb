class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :tel_number
      t.string :card_number
      t.string :address

      t.timestamps
    end
  end
end
