class CreateCardGameExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :card_game_experiences do |t|
      t.integer :card_game_id, null: false
      t.integer :experience_year, null: false
      t.integer :experience_mounth, null:false
      t.integer :resume_id, null: false

      t.timestamps
    end
  add_index :card_game_experiences, [:card_game_id,:resume_id], unique: true
  end
end
