class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :contacts, dependent: :destroy
  has_one :resume, dependent: :destroy

  def resume?
    self.resume || false
  end
end
