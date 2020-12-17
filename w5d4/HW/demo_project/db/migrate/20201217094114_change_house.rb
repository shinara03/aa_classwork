class ChangeHouse < ActiveRecord::Migration[5.2]
  def change
    remove_column :houses, :address
  end
end
