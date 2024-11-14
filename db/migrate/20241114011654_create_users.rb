class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.references :person, null: false, foreign_key: true
    end
  end
end
