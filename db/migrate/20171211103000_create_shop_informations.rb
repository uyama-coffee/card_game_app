class CreateShopInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :shop_informations do |t|
      t.string :shop_name
      t.string :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone_number
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
