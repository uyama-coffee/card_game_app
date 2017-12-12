class AddDefaultToShopInformations < ActiveRecord::Migration[5.1]
  def up
   change_column_null :shop_informations, :shop_name, false
   change_column_null :shop_informations, :description, false, 0
   change_column_null :shop_informations, :address, false
   change_column_null :shop_informations, :latitude, false, 0
   change_column_null :shop_informations, :longitude, false, 0
   change_column_null :shop_informations, :phone_number, false
  end

  def down
    change_column_null :shop_informations, :shop_name
    change_column_null :shop_informations, :description
    change_column_null :shop_informations, :address
    change_column_null :shop_informations, :latitude
    change_column_null :shop_informations, :longitude
    change_column_null :shop_informations, :phone_number
  end
end
