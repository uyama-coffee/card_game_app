class Project < ApplicationRecord
  belongs_to :shop, foreign_key: :shop_id
  has_many :contacts, dependent: :destroy
  #ProjectからPlaceを shop_infoとして呼び出せるようにする。
  has_one :shop_info, through: :shop, source: :place
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :content, presence: true
end
