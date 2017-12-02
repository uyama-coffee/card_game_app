class CardGameExperience < ApplicationRecord
  belongs_to :resume
  belongs_to :card_game

  validates :experience_year, presence:true
  validates :experience_month, presence:true
end
