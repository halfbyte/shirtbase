class CreateShirtImages < ActiveRecord::Migration
  def change
    create_table :shirt_images do |t|
      t.integer :shirt_id
      t.string :thumbnail_url
      t.string :medium_url
      t.string :large_url

      t.timestamps
    end
  end
end
