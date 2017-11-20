class CreateCardGameExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :card_game_experiences do |t|
      t.integer :experience_year, null: false
      t.integer :experience_mounth, null:false
      t.references :resume ,index: true, null: false
      t.references :card_game, index: true, null: false

      t.timestamps
    end
    add_index :card_game_experiences, [:card_game_id,:resume_id], unique: true
  end
end
