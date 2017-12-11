class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :contacts, dependent: :destroy
  has_many :contact_projects, through: :contacts, source: :project
  has_one :resume, dependent: :destroy
  has_many :card_game_experiences, through: :resume, source: :card_games


  def already_contacted?(project)
    contacts.exists?(project_id: project.id)
  end

  def resume?
    self.resume || false
  end
end
