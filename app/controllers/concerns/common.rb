module Common
  extend ActiveSupport::Concern
  def set_map(place)
    #地図情報の作成
    @map = ShopInformation.new.build_map(place)
    #MAP詳細つきのinfowindowを渡す
    @map[0][:infowindow]=render_to_string(partial: "shared/infowindow", locals: { place: place })
    #Action名がEditの場合だけture
    @is_mapedit = action_name == 'edit' ? true : false
  end
end