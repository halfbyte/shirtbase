require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:shirt_ownerships)
  should have_many(:shirts)
  should have_many(:created_shirts)
  
  test "to_param should return twitter nickname" do
    u = User.new # (:nickname => 'halfbyte')
    u.nickname = "halfbyte"
    assert_equal "halfbyte", u.to_param
  end
  
  should "should test omniauth code"
  
end
