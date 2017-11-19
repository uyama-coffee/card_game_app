class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :image
      t.string :title,    null: false
      t.text :content,    null: false
      t.references :shop, foreign_key: true, null: false

      t.timestamps
    end
  end
end
