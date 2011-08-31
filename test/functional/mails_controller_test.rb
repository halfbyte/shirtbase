require 'test_helper'

class MailsControllerTest < ActionController::TestCase
  context "getting a mail" do
    setup do
      @user = users(:standard)
      ENV['TRANSLOADIT_AUTH_KEY'] = 'foo'
      ENV['TRANSLOADIT_AUTH_SECRET'] = 'bar'
      
      Transloadit::Assembly.any_instance.stubs(:submit!)
    end
    
    should "create a shirt" do
      assert_difference "@user.shirts.count" do
        post_mail
      end
    end
    should "not create a shirt if no attachments" do
      assert_no_difference "@user.shirts.count" do
        post_mail(:attachments => 0)
      end
    end
  end
  
  def post_mail(opts = {})
    attrs = {
      :to => "#{@user.mailbox}@example.com",
      :subject => "The latest hot shirt",
      :text => 'This is a very cool shirt',
      :attachments => '1',
      :attachment1 => fixture_file_upload("files/image.jpg")
    }.merge(opts)
    post :create, attrs
  end
  
end
