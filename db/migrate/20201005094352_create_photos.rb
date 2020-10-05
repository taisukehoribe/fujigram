class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :body
      t.string :photo_image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
