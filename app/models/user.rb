class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :contacts, dependent: :destroy
  has_many :resumes, dependent: :destroy

  def resume?
    self.resume || false
  end
end
