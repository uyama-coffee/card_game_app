class CreateHandlingCardGames < ActiveRecord::Migration[5.1]
  def change
    create_table :handling_card_games do |t|
      t.references :project, foreign_key: true, null: false
      t.references :card_game, foreign_key: true, null: false

      t.timestamps
    end
  end
end
