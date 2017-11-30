class CardGame < ApplicationRecord
  has_one :card_game_experience

  #handling_card_games(中間テーブル)とのアソシエーション
  #カードゲームが消されると、当然handling_card_gameも消す
  has_many :handling_card_games, dependent: :destroy
  #カードゲームはhandling_card_gamesを介して複数のProjectに属する
  has_many :projects, :through => :handling_card_games
end
