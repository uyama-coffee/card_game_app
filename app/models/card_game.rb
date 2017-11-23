class CardGame < ApplicationRecord
  has_many :card_game_experiences, dependent: :destroy
end
