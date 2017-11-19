class CreateCardGames < ActiveRecord::Migration[5.1]
  def change
    create_table :card_games do |t|
      t.string :title, null: false
      t.timestamps
    end
    add_index :card_games, :title, unique: true
  end
end
