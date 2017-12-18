class Resume < ApplicationRecord
  belongs_to :user

  has_many :contacts, through: :users
  has_many :card_game_experiences, dependent: :destroy
  has_many :card_games, through: :card_game_experiences, source: :card_game
  accepts_nested_attributes_for :card_game_experiences, allow_destroy: true

  mount_uploader :profile_image, ImageUploader

  validates :profile_image,   presence: true
  validates :first_name,      presence: true
  validates :first_name_kana, presence: true
  validates :last_name,       presence: true
  validates :last_name_kana,  presence: true
  validates :contact_method,  presence: true


  extend Enumerize
  enumerize :contact_method, in: { email: 0, phone: 1 }
end
