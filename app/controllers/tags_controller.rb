class TagsController < ApplicationController
  
  def show
    @tag = params[:id]
    @shirts = Shirt.tagged_with(params[:id])
    render "shirts/index"
  end
end
