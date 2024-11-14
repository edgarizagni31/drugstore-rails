class CreateSalePackages < ActiveRecord::Migration[8.0]
  def change
    create_table :sale_packages do |t|
      t.datetime :delivery_at, null: false
      t.string :address, null: false
      t.string :status, null: false
      t.references :sale, null: false, foreign_key: true
      t.references :delivery, null: false, foreign_key: true
    end
  end
end
