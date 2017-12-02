class CardGameExperience < ApplicationRecord
  belongs_to :resume
  belongs_to :card_game

  #resumeに同じカードゲームは登録できない
  validates_uniqueness_of :resume_id, scope: :card_game_id   
end
