class ImagesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  # transloadit callback
  def create
    @shirt = Shirt.find(params[:shirt_id])
    if params[:transloadit]
      image = ShirtImage.from_transloadit(JSON.parse(params[:transloadit]))
      @shirt.shirt_images << image if image
    end
    render :text => 'Thanks, Transloadit'    
  end
end
