class Contact < ApplicationRecord
  belongs_to :user
  has_one :resume, through: :users
  has_many :projects, through: :project_contacts
  has_many :project_contacts, foreign_key: "contact_id",dependent: :destroy
end
