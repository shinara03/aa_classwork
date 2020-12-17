class AddHouse < ActiveRecord::Migration[5.2]
  def change
     add_column :houses, :address, :string
  end
end
