class AddEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mailbox, :string
  end
end
