class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :dish_group
      t.string :name
      t.text :description
      t.decimal :price
      t.string :photo
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
