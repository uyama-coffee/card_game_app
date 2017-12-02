class Resume < ApplicationRecord
  belongs_to :user
  belongs_to :contact

  #Projectは複数のhandling_card_gameを持ち、主従関係がある
  has_many :card_game_experiences, dependent: :destroy

  #Resumeはhandling_card_gameを介して複数のカードゲームを持つ
  #UserがResumeで登録したものを[card_games]として呼び出せるようにする。
  has_many :card_games, through: :card_game_experiences, source: :card_game
  #あえてProjectと同じにしましたが、変えたほうがいいですか？　←レビュー時に消してください。

  #関連項目も含めてまとめて保存する
  accepts_nested_attributes_for :card_game_experiences, allow_destroy: true

  mount_uploader :profile_image, ImageUploader

  extend Enumerize
  enumerize :contact_method, in: { email: 0, phone: 1 }
end
