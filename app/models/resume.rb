class Resume < ApplicationRecord
  belongs_to :user
  has_many :card_game_experiences, dependent: :destroy
  belongs_to :contact
end
