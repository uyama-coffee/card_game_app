class CardGameExperience < ApplicationRecord
  belongs_to :resume
  belongs_to :card_game

  validates_uniqueness_of :resume_id, scope: :card_game_id
  validates :experience_year, presence: true, length: { in: 1..2 }
  validates :experience_month, presence: true, length: { in: 1..2 }, inclusion: { in: (0..11).to_a }
end
