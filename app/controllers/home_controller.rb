class HomeController < ApplicationController
  
  def index
    @ladys = Item.where(category_id: [1, 10, 11 ,12, 13, 14, 15]).where(status: 0).order("created_at DESC").limit(10)
    @mens = Item.where(category_id: [2, 16, 17, 18, 19, 20, 21]).where(status: 0).order("created_at DESC").limit(10)
    @baby_kids = Item.where(category_id: [3, 22, 23 , 24, 25, 26, 27]).where(status: 0).order("created_at DESC").limit(10)
    @parents = Category.where(ancestry: nil)
  end
end
