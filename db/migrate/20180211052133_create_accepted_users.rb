class CreateAcceptedUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :accepted_users do |t|
      t.references :request, foreign_key: true
      t.references :user, foreign_key: true
    end

    add_index :accepted_users, [:request_id, :user_id], unique: true
  end
end
