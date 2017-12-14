class ShopInformation < ApplicationRecord
  belongs_to :shop
  
  geocoded_by :address
  after_validation :geocode

  def build_map(hash)
    Gmaps4rails.build_markers(hash) do |shop_information, marker|
      marker.lat shop_information.latitude
      marker.lng shop_information.longitude
    end
  end
end
