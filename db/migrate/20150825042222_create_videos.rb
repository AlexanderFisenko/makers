class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.attachment :video
      t.integer :maker_id, index: true

      t.timestamps null: false
    end
  end
end
