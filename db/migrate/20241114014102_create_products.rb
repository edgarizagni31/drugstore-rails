class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 150, null: false
      t.string :description, limit: 300, null: false
      t.string :price, null: false
      t.integer :stock_actual, null: false, default: 100
      t.integer :stock_min, null: false, default: 10
      t.references :subcategory, null: false, foreign_key: true
    end
  end
end
