class Project < ApplicationRecord
  belongs_to :shop, foreign_key: :shop_id
  has_many :contacts, dependent: :destroy
  has_many :handling_card_games, dependent: :destroy

  #ProjectからPlaceを[shop_info]として呼び出せるようにする。
  has_one :shop_info, through: :shop, source: :place
  #Projectから取り扱ってるカードゲームを[card_games]として呼び出せるようにする。
  has_many :card_games, through: :handling_card_games, source: :card_game

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :content, presence: true
end
