class TagsController < ApplicationController
  
  def show
    @tag = params[:id]
    @shirts = Shirt.tagged_with(params[:id]).order("created_at DESC").all
    render "shirts/index"
  end
end
