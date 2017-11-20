class Resume < ApplicationRecord
  belongs_to :user
  has_many :card_game_experiences, dependent: :destroy
  accepts_nested_attributes_for :card_game_experiences

  extend Enumerize
  enum contact_method: {email:1, phone:2}

end
