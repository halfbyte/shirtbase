class CreateShirtOwnerships < ActiveRecord::Migration
  def change
    create_table :shirt_ownerships do |t|
      t.integer :user_id
      t.integer :shirt_id

      t.timestamps
    end
  end
end
