require 'test_helper'

class ShirtsControllerTest < ActionController::TestCase
  setup do
    @shirt = shirts(:standard)
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shirts)
  end
  test "should get index as subresource" do
    get :index, :user_id => users(:standard).to_param
    assert_response :success
    assert_not_nil assigns(:shirts)
  end
  test "should get index as atom" do
    get :index, :format => "atom"
    assert_response :success
    assert_not_nil assigns(:shirts)
  end
  test "should get index as atom as subresource" do
    get :index, :user_id => users(:standard).to_param, :format => "atom"
    assert_response :success
    assert_not_nil assigns(:shirts)
  end


  test "should show shirt" do
    get :show, id: @shirt.to_param
    assert_response :success
  end
  
  context "as a logged in user" do
    setup do
      sign_in_as(users(:standard))
    end
    should "should get new" do
      get :new, :user_id => users(:standard).to_param #.to_param
      assert_response :success
    end

    should "should create shirt" do
      assert_difference('Shirt.count') do
        post :create, shirt: {:name => 'supershirt', :description => 'super description'}
      end

      assert_redirected_to user_shirts_path(users(:standard))
    end

    should "should get edit" do
      get :edit, id: @shirt.to_param
      assert_response :success
    end

    should "should update shirt" do
      put :update, id: @shirt.to_param, shirt: {description: "wooogooo"}
      assert_redirected_to user_shirts_path(users(:standard))
    end

    should "should destroy shirt" do
      assert_difference('Shirt.count', -1) do
        delete :destroy, id: @shirt.to_param
      end

      assert_redirected_to shirts_path
    end
  end
end
