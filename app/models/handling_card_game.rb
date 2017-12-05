class HandlingCardGame < ApplicationRecord
  belongs_to :card_game
  belongs_to :project

  validates_uniqueness_of :project_id, scope: :card_game_id  
end
