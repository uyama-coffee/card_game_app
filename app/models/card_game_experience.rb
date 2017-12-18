class CardGameExperience < ApplicationRecord
  belongs_to :resume
  belongs_to :card_game

  validates_uniqueness_of :resume_id, scope: :card_game_id
  validates :experience_year, presence: true, allow_blank: true, length: { in: 1..2 }
  validates :experience_month, presence: true, allow_blank: true, length: { in: 1..2 }, inclusion: { in: (0..11).to_a }

  def is_duplicate_cardgame(cardgame)
    #経験カードゲームが重複していた場合にfalseを返す
    cardgameID = []
    for x in cardgame do
      cardgameID << x.card_game_id
    end
    cardgameID.size == cardgameID.uniq.size
  end
end
