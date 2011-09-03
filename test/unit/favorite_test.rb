require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  
  should belong_to :user
  should belong_to :shirt
  
end
