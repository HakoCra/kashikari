class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :target, null: false
      t.string :text

      t.timestamps
    end

    add_foreign_key :messages, :users, column: :target_id
  end
end
