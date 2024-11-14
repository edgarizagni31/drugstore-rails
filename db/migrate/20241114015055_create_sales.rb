class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.integer :amount, null: false
      t.string :status, null: false
    end
  end
end
