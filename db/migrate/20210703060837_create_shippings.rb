class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string :postal_code, null: false
      t.integer :delivery_area_id, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :building_name, null: false
      t.string :phone_number, null: false
      t.references :purehase, null: false, foreign_key: true
      t.timestamps
    end
  end
end