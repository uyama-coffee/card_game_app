class Shop < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :projects, dependent: :destroy
  has_many :contacts, through: :projects

  def self.contacts
    Contact.where(project_id: shop_id)
  end
end
