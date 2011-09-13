require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  context "displaying a single tag" do
    setup do
      shirts(:standard).update_attribute(:tag_list, "foo, bar")
    end

    should "display page" do
      get :show, :id => 'foo'
      assert_response :success
    end
    
    should "display corresponding shirts" do
      get :show, :id => 'foo'
      assert assigns(:shirts).include?(shirts(:standard))
    end
    
  end
end
