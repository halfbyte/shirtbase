require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  should "display user index" do
    get :index
    assert_response :success
  end
end
