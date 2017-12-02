class CardGame < ApplicationRecord
  #中間テーブルとのアソシエーション
  #カードゲームが消されると、当然handling_card_gameとcard_game_experienceも消える
  has_many :handling_card_games, dependent: :destroy
  has_many :card_game_experience, dependent: :destroy
  
  #カードゲームはhandling_card_gamesを介して複数のProjectに属する
  has_many :projects, :through => :handling_card_games
  #カードゲームはcard_game_experienceを介してresumeにも属する
  has_many :resumes, :through => :card_game_experience

end
