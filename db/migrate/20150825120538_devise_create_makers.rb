class DeviseCreateMakers < ActiveRecord::Migration
  def change
    create_table(:makers) do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.timestamps null: false
    end
    add_index :makers, :email,                unique: true
  end
end
