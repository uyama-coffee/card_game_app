class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_many :contacts, dependent: :destroy
  has_one :resume, dependent: :destroy
  has_one :place, dependent: :destroy
  #user.contact_projectsで応募している案件を引っ張る
  has_many :contact_projects, through: :contacts, source: :project
  #応募してるかどうか判定するメソッド
  def already_contacted?(project)
    contacts.exists?(project_id: project.id)
  end

  def resume?
    self.resume || false
  end
  #user.contact_projectsで応募している案件を引っ張る
  has_many :contact_projects, through: :contacts, source: :project
  #応募してるかどうか判定するメソッド
  def already_contacted?(project)
    contacts.exists?(project_id: project.id)
  end

end
