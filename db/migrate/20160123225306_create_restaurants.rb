class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.text :address
      t.string :phone
      t.string :logo

      t.timestamps null: false
    end
  end
end
