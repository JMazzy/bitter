class CreateBits < ActiveRecord::Migration[5.0]
  def change
    create_table :bits do |t|
      t.integer :data
      t.integer :user_id

      t.timestamps
    end
  end
end
