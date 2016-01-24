class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2, null: false
      t.references :order, index: true, foreign_key: true
      t.references :dish, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
