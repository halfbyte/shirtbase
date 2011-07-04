class Shirt < ActiveRecord::Base
  has_many :shirt_images
  has_many :shirt_ownerships
  has_many :owners, :through => :shirt_ownerships, :source => :user
  belongs_to :user
  
  validates :name, :presence => true
  
end
