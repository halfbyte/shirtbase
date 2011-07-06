require 'test_helper'

class ShirtTest < ActiveSupport::TestCase
  
  should have_many :shirt_images
  should have_many :shirt_ownerships
  should have_many :owners
  should belong_to :user
  should validate_presence_of :name

  should "have taggable methods" do
    s = Shirt.new
    assert s.respond_to?(:tag_list)
    assert s.respond_to?(:tag_list=)
  end  
end
