class CreateMypages < ActiveRecord::Migration[5.1]
  def change
    create_table :mypages do |t|

      t.timestamps
    end
  end
end
