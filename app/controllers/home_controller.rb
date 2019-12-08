class HomeController < ApplicationController
  
  def index
    @items = Item.where(status: 0).order("created_at DESC").limit(10)
    @parents = Category.where(ancestry: nil)
  end

end
