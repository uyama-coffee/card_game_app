class Project < ApplicationRecord
  belongs_to :shop
  has_many :contacts
end
