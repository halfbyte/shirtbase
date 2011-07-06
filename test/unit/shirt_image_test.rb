require 'test_helper'

class ShirtImageTest < ActiveSupport::TestCase
  should belong_to(:shirt)
  should "create shirts from transloadit hash" do
    hash = {
      'results' => {
        'thumbnail' => [{'url' => 'http://example.com/image_thumb.jpeg'}],
        'medium' => [{'url' => 'http://example.com/image_medium.jpeg'}],
        'large' => [{'url' => 'http://example.com/image_large.jpeg'}],
      }
    }
    i = ShirtImage.from_transloadit(hash)
    assert_equal 'http://example.com/image_thumb.jpeg', i.thumbnail_url
    assert_equal 'http://example.com/image_medium.jpeg', i.medium_url
    assert_equal 'http://example.com/image_large.jpeg', i.large_url
  end
end
