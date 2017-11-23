class Contact < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :project
  has_one :resume, through: :user
  has_many :shop, through: :projects

  #同じUserが同じ募集に応募することはさせない
  validates_uniqueness_of :project_id, scope: :user_id

end
