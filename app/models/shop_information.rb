class ShopInformation < ApplicationRecord
  belongs_to :shop
  geocoded_by :address
  
  validates :shop_name,       presence: true
  validates :address,         presence: true, allow_blank: true
  validates :phone_number,    presence: true, phone: true,   allow_blank: true
  after_validation :latitude, presence: true
  after_validation :longitude,presence: true
  after_validation :geocode, if: Proc.new { |a| a.address_changed? }

  #MAP表示機能　必要な値を渡すメソッド
  def build_map(hash)
    Gmaps4rails.build_markers(hash) do |shop, marker|
      if shop.address.blank?
        #東京駅を表示しておく
        shop.latitude = 35.6811673
        shop.longitude = 139.7670516
      end
      marker.lat shop.latitude
      marker.lng shop.longitude
    end
  end
end
