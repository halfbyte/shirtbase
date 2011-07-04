class AddFieldsToShirts < ActiveRecord::Migration
  def change
    add_column :shirts, :url, :string
  end
end
