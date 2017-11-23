class CreateProjectContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :project_contacts do |t|
      t.references :project, index: true, foreign_key: true
      t.references :contact, index: true, foreign_key: true

      t.timestamps
    end
    add_index :project_contacts, [:project_id,:contact_id],unique: true
  end
end
