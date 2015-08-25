class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.string :authorable_type
      t.integer :authorable_id
      t.string :commentable_type
      t.integer :commentable_id

      t.timestamps null: false
    end
  end
end
