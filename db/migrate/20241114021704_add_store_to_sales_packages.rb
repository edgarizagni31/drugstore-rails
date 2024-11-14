class AddStoreToSalesPackages < ActiveRecord::Migration[8.0]
  def change
    add_reference :sale_packages, :store, null: false, foreign_key: true
  end
end
