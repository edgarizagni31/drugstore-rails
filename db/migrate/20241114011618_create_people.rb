class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :dni, limit: 8, null: false
      t.string :name, limit: 200
      t.string :address, limit: 200
      t.string :phone, limit: 12
      t.references :role, null: false, foreign_key: true
    end
  end
end
