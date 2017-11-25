class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_one :resume, through: :user
end
