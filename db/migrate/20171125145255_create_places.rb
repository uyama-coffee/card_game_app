class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
