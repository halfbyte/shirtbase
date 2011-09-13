class Shirt < ActiveRecord::Base
  has_many :shirt_images
  has_many :shirt_ownerships
  has_many :owners, :through => :shirt_ownerships, :source => :user
  belongs_to :user
  has_many :favorites
  has_many :users_who_faved, :through => :favorites, :source => :user

  include ActionView::Helpers::TextHelper
    
  def initialize(*params)
    super
    create_tweet
  end
  
  attr_accessor :want_tweet
  attr_reader :tweet
  
  def tweet=(tweet_text)
    @tweet = truncate(tweet_text, :length => 115)
  end
  
  acts_as_taggable
  
  validates :name, :presence => true

  has_friendly_id :name, :use_slug => true  
  
  def send_tweet(url)
    return if @want_tweet.blank? || @want_tweet != '1'
    logger.debug("About to send a tweet, woot!")
    Twitter.configure do |config|
      config.oauth_token = user.access_token
      config.oauth_token_secret = user.access_token_secret
    end
    result = Twitter.update("#{@tweet} #{url}")    
    logger.debug(result.inspect)
  rescue => e
    logger.error(e)
  end
  
private
  def create_tweet
    @tweet = "Look ma, my new shirt"
  end
  
  
end
