class Resume < ApplicationRecord
  belongs_to :user

  #ResumeはUsersを介して複数のContactを持つ
  has_many :contacts, through: :users

  #Resumeは複数のcard_game_experiencesを持ち、主従関係がある
  has_many :card_game_experiences, dependent: :destroy

  #Resumeはhandling_card_gameを介して複数のカードゲームを持つ
  #UserがResumeで登録したものを[card_games]として呼び出せるようにする。
  has_many :card_games, through: :card_game_experiences, source: :card_game

  #関連項目も含めてまとめて保存する
  accepts_nested_attributes_for :card_game_experiences, allow_destroy: true

  mount_uploader :profile_image, ImageUploader

  #Validation
  validates :profile_image,   presence: true
  validates :first_name,      presence: true
  validates :first_name_kana, presence: true
  validates :last_name,       presence: true
  validates :last_name_kana,  presence: true
  validates :contact_method,  presence: true
  validates :phone_number,    presence: true

  extend Enumerize
  enumerize :contact_method, in: { email: 0, phone: 1 }
end
