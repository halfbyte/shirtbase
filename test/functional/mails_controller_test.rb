require 'test_helper'
require 'mail'
class MailsControllerTest < ActionController::TestCase
  context "getting a mail" do
    setup do
      @user = users(:standard)
      ENV['TRANSLOADIT_AUTH_KEY'] = 'foo'
      ENV['TRANSLOADIT_AUTH_SECRET'] = 'bar'
      @image_upload = fixture_file_upload("files/image.jpg")
      
      Transloadit::Assembly.any_instance.stubs(:submit!)
    end
    
    should "create a shirt" do
      assert_difference "@user.created_shirts.count" do
        post_mail
      end
    end
        
    should "send only images to transloadit" do
      Transloadit::Assembly.any_instance.expects(:submit!).with(@image_upload)
      post_mail
    end
    should "not create a shirt if no attachments" do
      assert_no_difference "@user.created_shirts.count" do
        post_mail(:attachments => 0, :"attachment-info" => "{}")
      end
    end
  end
  
  def post_mail(opts = {})
    attrs = {
      :to => "Test <#{@user.mailbox}@example.com>",
      :subject => "The latest hot shirt",
      :text => 'This is a very cool shirt',
      :"attachment-info" => {:attachment2 => {:type => 'text/plain'}, :attachment1 => {:type => 'image/jpeg'} }.to_json,
      :attachments => '2',
      :attachment1 => @image_upload,
      :attachment2 => fixture_file_upload("files/fake.txt")
    }.merge(opts)
    post :create, attrs
  end
  
end
