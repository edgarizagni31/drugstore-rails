class AddCustomerAndStorekeeperToSales < ActiveRecord::Migration[8.0]
  def change
    add_reference :sales, :customer, null: false, foreign_key: {to_table: :people}
    add_reference :sales, :storekeeper, null: false, foreign_key: {to_table: :people}
  end
end
