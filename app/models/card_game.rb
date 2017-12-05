class CardGame < ApplicationRecord
  has_one :card_game_experience
  has_one :handling_card_game
  has_many :handling_card_games, dependent: :destroy
  has_many :projects, through: :handling_card_games
end
