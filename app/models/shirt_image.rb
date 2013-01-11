class ShirtImage < ActiveRecord::Base
  belongs_to :shirt
  attr_accessible :thumbnail_url, :medium_url, :large_url
  
  def self.from_transloadit(params)
    return nil if params['results'].nil? || params['results'].empty?
    ShirtImage.new(
      thumbnail_url: params['results']['thumbnail'].first['url'],
      medium_url: params['results']['medium'].first['url'],
      large_url: params['results']['large'].first['url']
    )
  end
  
end
