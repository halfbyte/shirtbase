class FavoritesController < ApplicationController
  
  before_filter :login_required!
  before_filter :find_shirt
  
  def create
    @shirt.users_who_faved << current_user unless @shirt.users_who_faved.include?(current_user)
    redirect_to @shirt, :notice => 'Thanks for your fav!'
  end
  
  def destroy
    @shirt.users_who_faved.delete(current_user) if @shirt.users_who_faved.include?(current_user)
    redirect_to @shirt, :notice => 'Fair enough.'    
  end
  
private
  def find_shirt
    @shirt = Shirt.find(params[:shirt_id])
  end
  
end
