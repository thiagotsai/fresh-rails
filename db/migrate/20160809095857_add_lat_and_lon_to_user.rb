class AddLatAndLonToUser < ActiveRecord::Migration
  def change
    add_column :users, :lat, :float
    add_column :users, :lon, :float
  end
end
