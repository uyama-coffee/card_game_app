class ShopInformation < ApplicationRecord
  belongs_to :shop
  geocoded_by :address

  #緯度経度を変更時に住所を修正　ただしこのままでは 「日本、〒160-0023 東京都新宿区 東京都庁」という表記になる。
  Geocoder.configure(language: :ja)
  reverse_geocoded_by :latitude, :longitude

  validates :shop_name,   presence: true
  validates :address,     presence: true
  validates :phone_number,presence: true
  after_validation :geocode, if: Proc.new { |a| a.address_changed? }
  #after_validation :reverse_geocode, if: Proc.new { |a| a.latitude_changed? or a.longitude_changed? }

  #MAP表示機能　必要な値を渡すメソッド
  def build_map(hash)
    Gmaps4rails.build_markers(hash) do |shop, marker|
      if shop.address.blank?
        #東京駅を表示しておく
        shop.latitude = 35.6894875
        shop.longitude = 139.6917064
      end
      marker.lat shop.latitude
      marker.lng shop.longitude
    end
  end
end
