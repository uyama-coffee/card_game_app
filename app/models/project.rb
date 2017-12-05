class Project < ApplicationRecord

  belongs_to :shop, foreign_key: :shop_id
  has_many :contacts, dependent: :destroy
  has_many :handling_card_games, dependent: :destroy
  has_many :card_games, through: :handling_card_games, source: :card_game
  has_one :shop_info, through: :shop, source: :place
  
  accepts_nested_attributes_for :handling_card_games, allow_destroy: true

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :content, presence: true
end
