class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date
      t.decimal :sub_total, precision: 8, scale: 2, default: 0.0, null: false
      t.decimal :taxes, precision: 8, scale: 2, default: 0.0, null: false
      t.decimal :total, precision: 8, scale: 2, default: 0.0, null: false
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
