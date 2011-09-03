require 'test_helper'

class FavoritesControllerTest < ActionController::TestCase
  
  context "creating favs" do
    setup do
      sign_in_as(users(:standard))
      @shirt = shirts(:standard)
    end
    should "create fav" do
      assert_difference "Favorite.count" do
        post :create, :shirt_id => @shirt.to_param
      end
    end
    should "redirect to shirt" do
      post :create, :shirt_id => @shirt.to_param
      assert_redirected_to shirt_path(@shirt)
    end
    
    should "not create favs twice" do
      @shirt.users_who_faved << users(:standard)

      assert_no_difference "Favorite.count" do
        post :create, :shirt_id => @shirt.to_param
      end      
    end
    
  end
  
  context "destroying favs" do
    setup do
      sign_in_as(users(:standard))
      @shirt = shirts(:standard)
      @shirt.users_who_faved << users(:standard)
    end
    should "destroy fav" do
      assert @shirt.reload.users_who_faved.include?(users(:standard))
      assert_difference "Favorite.count", -1 do
        delete :destroy, :shirt_id => @shirt.to_param
      end
    end
    
    should "redirect to shirt" do
      delete :destroy, :shirt_id => @shirt.to_param
      assert_redirected_to shirt_path(@shirt)      
    end
    
  end
  
end
