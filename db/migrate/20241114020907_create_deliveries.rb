class CreateDeliveries < ActiveRecord::Migration[8.0]
  def change
    create_table :deliveries do |t|
      t.datetime :date, default: Time.now
      t.references :motorized, null: false, foreign_key: {to_table: :people}
      t.references :clerk, null: false, foreign_key: {to_table: :people}
    end
  end
end
