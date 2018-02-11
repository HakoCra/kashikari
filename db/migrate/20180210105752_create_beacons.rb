class CreateBeacons < ActiveRecord::Migration[5.1]
  def change
    create_table :beacons do |t|
      t.references :user, foreign_key: true
      t.integer :major, null: false
      t.integer :minor, null: false

      t.timestamps
    end

    add_index :beacons, [:major, :minor], unique: true
  end
end
