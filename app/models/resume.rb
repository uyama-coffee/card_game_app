class Resume < ApplicationRecord
  belongs_to :user
  has_many :cart_game_experiences, dependent: :destroy
end
