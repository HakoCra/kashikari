class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :title, null: false
      t.float :timelimit
      t.string :reward
      t.text :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
