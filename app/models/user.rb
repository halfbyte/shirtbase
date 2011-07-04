class User < ActiveRecord::Base
  has_many :shirt_ownerships
  has_many :shirts, :through => :shirt_ownerships, :source => :shirt
  
  has_many :created_shirts, :foreign_key => :user_id, :class_name => "Shirt"
  
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
    end
  end
end
