class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :date
      t.decimal :sub_total
      t.decimal :taxes
      t.decimal :total
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
