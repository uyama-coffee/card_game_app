class CardGameExperience < ApplicationRecord
  belongs_to :resume
  belongs_to :card_game
end
