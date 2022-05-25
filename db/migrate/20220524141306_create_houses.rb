class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :nature
      t.decimal :rent
      t.integer :bathrooms
      t.integer :bedrooms
      t.string :description
      t.boolean :pets

      t.timestamps
    end
  end
end
