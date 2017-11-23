class Project < ApplicationRecord
  has_many :contacts
  belongs_to :shop, foreign_key: :shop_id
  has_many :contacts, dependent: :destroy
  
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :content, presence: true
end
