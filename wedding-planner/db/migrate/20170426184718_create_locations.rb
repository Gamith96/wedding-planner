class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :photo_img,  null: true, default: ""
      t.string :url,        null: true, default: ""
      t.string :address,    null: false, default: ""
      t.string :name,       null: false, default: ""
      t.integer :price,     null: false, default: 0
      t.integer :max_capacity, null: true

      t.timestamps
    end
  end
end
