class User < ActiveRecord::Base
  has_many :shirt_ownerships
  has_many :shirts, :through => :shirt_ownerships, :source => :shirt
  
  has_many :created_shirts, :foreign_key => :user_id, :class_name => "Shirt"
  
  before_create :ensure_mailbox
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.nickname = auth["user_info"]["nickname"]
      user.access_token = auth["credentials"]["token"]
      user.access_token_secret = auth["credentials"]["secret"]
    end
  end
  
  def to_param
    nickname
  end
  
private

  def ensure_mailbox
    return if mailbox.present?
    token = ""
    begin 
      token = Token.readable(8)
    end while User.find_by_mailbox(token)
    self.mailbox = token
  end
  
end
