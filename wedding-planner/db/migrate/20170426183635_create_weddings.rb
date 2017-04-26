class CreateWeddings < ActiveRecord::Migration[5.0]
  def change
    create_table :weddings do |t|
      t.string :couple_name,     null: false, default: ""
      t.datetime :wedding_date
      t.integer :max_budget
      t.integer :min_budget
      t.references :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
