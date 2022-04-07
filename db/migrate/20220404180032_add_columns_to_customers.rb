class AddColumnsToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column(:customers, :account_name, :varchar)
    add_foreign_key(:customers, :provinces, column: :province_id)
  end
end
