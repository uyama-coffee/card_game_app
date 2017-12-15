class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_one :resume, through: :user
  has_many :shop, through: :projects

  validates_uniqueness_of :project_id, scope: :user_id
  validates email, uniqueness: true
  extend Enumerize
  enumerize :status, in: { unsupported: 0, in_progress: 1, adopted: 2, not_adopted: 3 }
end
