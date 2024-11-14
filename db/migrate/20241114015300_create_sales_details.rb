class CreateSalesDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :sales_details do |t|
      t.integer :quantity, default: 1
      t.integer :amount, null: false
      t.references :sample, null: false, foreign_key: true
      t.references :sale, null: false, foreign_key: true
    end
  end
end
