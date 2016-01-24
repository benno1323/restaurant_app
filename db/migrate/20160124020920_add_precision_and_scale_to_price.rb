class AddPrecisionAndScaleToPrice < ActiveRecord::Migration
  def change
  	change_column :dishes, :price, :decimal, precision: 8, scale: 2,
  								default: 0.0, null: false
  end
end
