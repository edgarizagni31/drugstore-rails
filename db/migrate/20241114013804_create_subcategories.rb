class CreateSubcategories < ActiveRecord::Migration[8.0]
  def change
    create_table :subcategories do |t|
      t.string :name, limit: 100, null: false
      t.references :category, null: false, foreign_key: true
    end
  end
end
