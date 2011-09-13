class TagsController < ApplicationController
  
  def show
    @tag = params[:id]
    @shirts = Shirt.tagged_with(params[:id]).order("created_at DESC").page(params[:page])
    @feed_url = tag_url(:id => @tag, :format => :atom)
    render "shirts/index"
  end
end
