class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.integer :status, default: 0, null: false
      t.references :user, foreign_key: true, null: false
      t.references :project, foreign_key: true, null: false

      t.timestamps
    end
  end
end
