class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :contact,optional: true

  validates :first_name, :first_name_kana, :last_name, :last_name_kana, presence: true

  has_many :card_game_experiences, dependent: :destroy
  accepts_nested_attributes_for :card_game_experiences

  extend Enumerize
  enumerize :contact_method, in: { email: 0, phone: 1 }
end
