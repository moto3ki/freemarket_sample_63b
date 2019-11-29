class HomeController < ApplicationController
  
  def index
    @items = Item.all.order("created_at DESC").limit(10)
    @item_images = ItemImage.all.order("created_at DESC").limit(10)
  end
  
end
