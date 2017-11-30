class CardGame < ApplicationRecord
  has_one :card_game_experience
  has_one :handling_card_game
end
