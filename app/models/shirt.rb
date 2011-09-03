class Shirt < ActiveRecord::Base
  has_many :shirt_images
  has_many :shirt_ownerships
  has_many :owners, :through => :shirt_ownerships, :source => :user
  belongs_to :user
  has_many :favorites
  has_many :users_who_faved, :through => :favorites, :source => :user
  
  acts_as_taggable
  
  validates :name, :presence => true

  has_friendly_id :name, :use_slug => true
  
end
