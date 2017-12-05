class CardGame < ApplicationRecord
  has_many :handling_card_games, dependent: :destroy
  has_many :card_game_experience, dependent: :destroy
  has_many :projects, through: :handling_card_games
  has_many :resumes, through: :card_game_experience
end
