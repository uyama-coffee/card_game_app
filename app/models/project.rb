class Project < ApplicationRecord
  belongs_to :shop, foreign_key: :shop_id
  has_many :contacts, dependent: :destroy

  #Projectは複数のhandling_card_gameを持ち、主従関係がある
  has_many :handling_card_games, dependent: :destroy

  #Projectはhandling_card_gameを介して複数のカードゲームを持つ
  #Projectから取り扱ってるカードゲームを[card_games]として呼び出せるようにする。
  has_many :card_games, through: :handling_card_games, source: :card_game

  #関連項目も含めてまとめて保存する
  accepts_nested_attributes_for :handling_card_games, allow_destroy: true

  #ProjectからPlaceを[shop_info]として呼び出せるようにする。
  has_one :shop_info, through: :shop, source: :place

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :content, presence: true
end
