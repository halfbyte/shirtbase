require 'test_helper'

class ShirtOwnershipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:shirt)
end
