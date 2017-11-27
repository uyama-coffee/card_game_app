class RenameExperienceMounthColumnToCardGameExperiences < ActiveRecord::Migration[5.1]
  def change
    rename_column :card_game_experiences, :experience_mounth, :experience_month
  end
end
