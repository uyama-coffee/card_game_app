class Project < ApplicationRecord
  belongs_to :shop, foreign_key: :shop_id
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :content, presence: true

end
