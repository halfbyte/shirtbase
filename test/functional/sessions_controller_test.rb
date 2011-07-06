require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  should "log the user out" do
    get :destroy
    assert_redirected_to root_path
    assert_nil session[:user_id]
  end
end
