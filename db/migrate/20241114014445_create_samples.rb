class CreateSamples < ActiveRecord::Migration[8.0]
  def change
    create_table :samples do |t|
      t.string :batch_number
      t.date :production_date
      t.date :expiry_date
      t.references :product, null: false, foreign_key: true
    end
  end
end
