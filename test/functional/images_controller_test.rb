require 'test_helper'

class ImagesControllerTest < ActionController::TestCase
  context "transloadit callback" do
    setup do
      @user = users(:standard)
      @shirt = shirts(:standard)
    end
    
    should "create image" do
      assert_difference "@shirt.shirt_images.count" do
        transloadit_call
      end
    end
  end
  
  
  def transloadit_call(file = nil)
    post :create, :shirt_id => @shirt.to_param, :transloadit => File.read(File.join(Rails.root, "test/fixtures/files/#{file || 'transloadit'}.json"))
  end
  
end
