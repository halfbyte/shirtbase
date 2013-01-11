class Shirt < ActiveRecord::Base
  has_many :shirt_images
  has_many :shirt_ownerships
  has_many :owners, :through => :shirt_ownerships, :source => :user
  belongs_to :user
  has_many :favorites
  has_many :users_who_faved, :through => :favorites, :source => :user

  after_initialize :create_tweet

  acts_as_taggable
  
  validates :name, :presence => true
  validate :validate_len_of_tweet

  has_friendly_id :name, :use_slug => true  

  attr_accessible :name, :want_tweet, :tweet, :description

  include ActionView::Helpers::TextHelper
    
  # def initialize(*params)
  #   create_tweet
  #   super
  # end
  
  attr_accessor :want_tweet
  attr_accessor :tweet  
  
  def send_tweet(url)
    return if @want_tweet.blank? || @want_tweet != '1'
    return if @tweet.blank?
    logger.debug("About to send a tweet, woot! ")
    Twitter.configure do |config|
      config.oauth_token = user.access_token
      config.oauth_token_secret = user.access_token_secret
    end
    tweet_text = @tweet.gsub(/\[SHIRT\]/, truncate(name, :length => 115 - short_tweet.length)).gsub(/\[LINK\]/, url)
    result = Twitter.update("#{tweet_text}")
    logger.debug(result.inspect)
  rescue => e
    logger.error(e)
  end
  
private
  def create_tweet
    @tweet ||= "just added [SHIRT] to @outtacotton [LINK]"
  end
  
  def short_tweet
    @short_tweet ||= @tweet.gsub(/\[SHIRT\]/, '').gsub(/\[LINK\]/, '') if @tweet
  end
  
  def validate_len_of_tweet
    return if short_tweet.nil?
    if (115-short_tweet.length) < 10
      errors.add(:tweet, 'Sorry, your tweet text is too long to make sense')
    end
  end
  
end
