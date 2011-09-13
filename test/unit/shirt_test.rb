require 'test_helper'

class ShirtTest < ActiveSupport::TestCase
  
  should have_many :shirt_images
  should have_many :shirt_ownerships
  should have_many :owners
  should belong_to :user
  should have_many :favorites
  should have_many :users_who_faved
  
  should validate_presence_of :name

  should "have taggable methods" do
    s = Shirt.new
    assert s.respond_to?(:tag_list)
    assert s.respond_to?(:tag_list=)
  end
  
  context "tweeting a shirt" do
    should "have a tweet after initializing" do
      shirt = Shirt.new
      assert_not_nil shirt.tweet
    end
    should "tweet if want_tweet is set" do
      Twitter.expects(:update).with('added shirt foo to @outtacotton http://example.com/foobar').once
      shirt = Shirt.new(:name => 'foo', :want_tweet => '1', :tweet => 'added shirt [SHIRT] to @outtacotton [URL]')
      shirt.send_tweet('http://example.com/foobar')
    end
  end
  
  
end
