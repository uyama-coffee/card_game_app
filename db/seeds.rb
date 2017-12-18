card_list = %w(mtg 遊戯王 デュエルマスターズ ヴァイスシュヴァルツ ヴァンガード  バディファイト ウィクロス Z/X ポケモン)

card_list.each do |title|
  CardGame.create(title: title)
end
