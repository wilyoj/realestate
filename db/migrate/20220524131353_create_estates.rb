class CreateEstates < ActiveRecord::Migration[6.1]
  def change
    create_table :estates do |t|
      t.string :name
      t.string :coordinates
      t.string :neighourhood
      t.string :schools
      t.string :crime
      t.string :nearby
      t.references :location, null: true, foreign_key: true

      t.timestamps
    end
  end
end
