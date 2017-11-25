class Place < ApplicationRecord
  belongs_to :shop
  #adressの値から場所を検索
  geocoded_by :address
  after_validation :geocode
end
