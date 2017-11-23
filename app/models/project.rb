class Project < ApplicationRecord
  belongs_to :shop
  has_many :contacts, through: :project_contacts
  has_many :project_contacts, foreign_key: "project_id", dependent: :destroy
end
