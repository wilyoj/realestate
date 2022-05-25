class AddHouseNumberToHouses < ActiveRecord::Migration[6.1]
  def change
    add_column :houses, :house_number, :string
  end
end
