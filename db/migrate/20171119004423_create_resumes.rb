class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      t.string  :profile_image   ,null: false
      t.string  :first_name      ,null: false
      t.string  :first_name_kana ,null: false
      t.string  :last_name       ,null: false
      t.string  :last_name_kana  ,null: false
      t.integer :contact_method  ,null: false ,default: 0
      t.string  :phone_number
      t.references :user, index: true ,null:false
      t.timestamps
    end
  end
end
