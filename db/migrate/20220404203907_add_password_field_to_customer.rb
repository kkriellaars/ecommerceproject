class AddPasswordFieldToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column(:customers, :password, :varchar)
  end
end
