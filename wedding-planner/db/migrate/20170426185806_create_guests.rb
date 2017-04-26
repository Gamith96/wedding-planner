class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.boolean :rsvp, null: false, default: false
      t.string :name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.references :wedding, foreign_key: true

      t.timestamps
    end
  end
end
