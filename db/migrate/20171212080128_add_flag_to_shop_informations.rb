class AddFlagToShopInformations < ActiveRecord::Migration[5.1]
  def change
    add_column :shop_informations, :flag, :boolean, default: false, null: false
  end
end
