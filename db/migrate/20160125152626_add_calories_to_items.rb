class AddCaloriesToItems < ActiveRecord::Migration
  def change
    add_column :items, :calories, :integer
  end
end
