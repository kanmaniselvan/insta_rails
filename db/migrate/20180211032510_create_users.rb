class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :username, null: false
      t.text :profile_picture
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps

      t.timestamps
      t.index [:provider, :uid], unique: true
    end
  end
end
