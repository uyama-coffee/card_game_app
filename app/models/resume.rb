class Resume < ApplicationRecord
  belongs_to :user
  has_many :card_game_experiences, dependent: :destroy
  accepts_nested_attributes_for :card_game_experiences

  extend Enumerize
  enumerize :contact_method, in: { email: 0, phone: 1 }
end
