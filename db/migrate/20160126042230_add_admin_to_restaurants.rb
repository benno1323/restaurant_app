class AddAdminToRestaurants < ActiveRecord::Migration
  def change
    add_reference :restaurants, :admin, index: true, foreign_key: true
  end
end
