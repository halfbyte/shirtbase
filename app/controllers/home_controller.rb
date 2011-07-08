class HomeController < ApplicationController
  def index
    @shirts = Shirt.order("created_at DESC").limit(8)
  end

end
