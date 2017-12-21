class ShopInformation < ApplicationRecord
  belongs_to :shop

  geocoded_by :address
  after_validation :geocode, if: Proc.new { |a| a.address_changed? }
  #MAP表示機能　必要な値を渡すメソッド
  def build_map(hash)
    Gmaps4rails.build_markers(hash) do |shop, marker|
      marker.lat shop.latitude
      marker.lng shop.longitude
    end
  end
end
