class Favorite < ActiveRecord::Base
  belongs_to :shirt
  belongs_to :user
end
