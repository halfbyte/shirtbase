class AddTwitterFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :description, :text
    add_column :users, :access_token, :string
    add_column :users, :access_token_secret, :string    
  end
end
