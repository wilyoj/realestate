class AddCountryToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :country, :string
    add_column :locations, :county, :string
    add_column :locations, :subcounty, :string
  end
end
