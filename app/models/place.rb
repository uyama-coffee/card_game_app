class Place < ApplicationRecord
  belongs_to :shop

  #adressの値から場所を検索
  geocoded_by :address
  after_validation :geocode

  #MAP表示機能　必要な値を渡すメソッド
  def build_map(hash)
    Gmaps4rails.build_markers(hash) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.name
      #marker.infowindow render_to_string(partial: "/places/infowindow", locals: { place: place })
    end
  end

end
