class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments do |t|
      t.references :cashier_id, null: false, foreign_key: { to_table: :people }
      t.integer :total, null: false
      t.datetime :created_at, default: Time.now
      t.string :data
      t.references :sale, null: false, foreign_key: true
    end
  end
end
